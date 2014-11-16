
import athenadb
import athenascraper

# This is how you would read data from the database!
# db = athenadb.AthenaPatientDatabase("patient.db")
# currentCount = db.currentMaxPatientId()
# patient =  db.getPatient(5)
# print patient.patient_json # get patient information
# print patient.problems_json # get associated problems

scraper = athenascraper.AthenaScraper() #enter key and secret in athenascraper.py
# patient = scraper.scrapePatient(4) #scrape specific entry -> DOES NOT SAVE TO DB
# print patient.patient_json # get patient information
# print patient.problems_json # get associated problems
scraper.scrapeMoreData(1000) #scrape n  more rows -> WRITES DATA TO DB