# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_auto_20141115_2048'),
    ]

    operations = [
        migrations.AlterField(
            model_name='encounter',
            name='doctor',
            field=models.ForeignKey(related_name=b'doctor_encounters', blank=True, to='core.UserProfile', null=True),
        ),
        migrations.AlterField(
            model_name='encounter',
            name='patient',
            field=models.ForeignKey(related_name=b'patient_encounters,', blank=True, to='core.UserProfile', null=True),
        ),
    ]
