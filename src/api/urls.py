from django.conf.urls import *
from src.api import viewsets

urlpatterns = patterns('',
    url(r'^account_info/', 'api.views.account_info'),
    url(r'^user-lookup/(?P<username>)/$', 'api.views.user_lookup'),
    url(r'^docs/', include('rest_framework_swagger.urls')),
    url(r'^', include(viewsets.router.urls)),
)
