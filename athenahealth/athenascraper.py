import athenahealthapi
import athenadb
import json
import time

####################################################################################################
# Setup
####################################################################################################
key = 'z9p2u2tfvw4tqqx48kk884yc'
secret = 'rzdHY5SkFjrqmby'
version = 'preview1'
practiceid = 195900
db_filename = 'patient.db'

class AthenaScraper(object):
	def __init__(self):
		self.__api = athenahealthapi.APIConnection(version, key, secret, practiceid)
		self.__db = athenadb.AthenaPatientDatabase(db_filename)

	def scrapeMoreData(self, count):
		currentCount = self.__db.currentMaxPatientId()
		for x in range(currentCount, currentCount+count):
			x += 1
			patient = self.scrapePatient(x)
			if patient is not None:
				self.__db.createNewPatient(patient)
			time.sleep(0.5) # 5 requests every second

	def scrapePatient(self, patient_id):
		if not self.__db.doesPatientExist(patient_id):
			#synchronous calls, yeah. see if I care. hardcoded department id because what is that??
			
			patient_response = self.__api.GET("/patients/" + str(patient_id))

			if not 'error' in patient_response:
				problems_json = self.__api.GET("/chart/" + str(patient_id) + "/problems?departmentid=1")
				patient_json = patient_response[0] #api gives us an array
				print patient_json

				print "Fetched patient name :" + patient_json["lastname"] + ", " + patient_json["firstname"]
				patient = athenadb.AthenaPatient()
				patient.patient_id = int(patient_id)
				patient.problems_json = json.dumps(problems_json)
				patient.patient_json = json.dumps(patient_json) 	

				return patient
		else:
			print "patient with id" + str(patient_id) + "already exists, skipping"
			return None