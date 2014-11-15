from django.conf.urls import *
from src.api import viewsets

urlpatterns = patterns('',
    url(r'^', include(viewsets.router.urls)),
)
