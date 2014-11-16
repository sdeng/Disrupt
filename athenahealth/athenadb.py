"""
This module represents...I don't know yet.
"""

# from pymongo import MongoClient
import sqlite3


"""
Wrapper around what we consider a patient document. This consists of the patient record.
"""
class AthenaPatient(object):
	def setDbRow(db_row):
		self.pk = db_row[0]
		self.patient_id = db_row[1]
		self.patient_json = db_row[2]
		self.problems_json = db_row[3]

class AthenaPatientDatabase(object):
	def __init__(self, db_filename):
		self.__conn = sqlite3.connect(db_filename)

	def currentMaxPatientId(self):
		cursor = self.__conn.cursor()
		cursor.execute("SELECT max(patient_id) FROM `Patient`")
		return cursor.fetchone()[0]

	def getPatient(self, patient_id):
		cursor = self.__conn.cursor()
		cursor.execute("SELECT * FROM `Patient` WHERE `patient_id`=:the_id", {"the_id" : patient_id})
		if cursor.rowcount == 1:
			row = cursor.fetchone()
			patient = AthenaPatient()
			patient.setDbRow(row)
		else:
			patient = None
		return patient

	def createNewPatient(self, athenapatient):
		try:
			cursor = self.__conn.cursor()
			cursor.execute("INSERT INTO `Patient` VALUES (?, ?, ?, ?)", (cursor.lastrowid, athenapatient.patient_id, athenapatient.patient_json, athenapatient.problems_json))
			self.__conn.commit()
		except sqlite3.Error, e:
			print "db error: %s" % e.args[0]

	def doesPatientExist(self, patient_id):
		patient = self.getPatient(patient_id)
		return (patient is not None)

