# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_auto_20141115_1934'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='user',
            field=models.OneToOneField(related_name=b'profile', to=settings.AUTH_USER_MODEL),
        ),
    ]
