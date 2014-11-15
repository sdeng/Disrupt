from django.db import models
from django.contrib.auth.models import User

class TimestampMixin(models.Model):
    class Meta:
        abstract = True
    update_date = models.DateTimeField(auto_now=True)
    create_date = models.DateTimeField(auto_now_add=True)

class UserProfile(TimestampMixin):
    PROVIDER  = 'PROVIDER'
    PATIENT   = 'PATIENT'
    TYPES     = ((PROVIDER,'provider'),(PATIENT, 'patient'))
    user_type = models.CharField(max_length=255, choices=TYPES)
    user      = models.ForeignKey(User)

class Encounter(TimestampMixin):
    athenahealth_encounter_id   = models.IntegerField()
    patient                     = models.ForeignKey('UserProfile', related_name='patient_encounters')
    doctor                      = models.ForeignKey('UserProfile', related_name='doctor_encounters')
    diagnosis                   = models.ManyToManyField('Diagnosis', null=True, blank=True)
    treatment_plan              = models.ManyToManyField('TreatmentPlan',  null=True, blank=True)
    life_style                  = models.ManyToManyField('Lifestyle', null=True, blank=True)

class Diagnosis(TimestampMixin):
    code = models.CharField(max_length=255)

class TreatmentPlan(TimestampMixin):
    name = models.CharField(max_length=255)

class Lifestyle(TimestampMixin):
    name = models.CharField(max_length=255)
