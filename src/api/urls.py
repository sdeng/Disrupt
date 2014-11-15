from django.conf.urls import *
from src.api import viewsets

urlpatterns = patterns('',
	url(r'^obtain-auth-token', 'rest_framework.authtoken.views.obtain_auth_token'),
    url(r'^account_info/', 'api.views.account_info'),
    url(r'^user-lookup/(?P<username>)/$', 'api.views.user_lookup'),
    url(r'^sync_encounters/$', 'api.views.sync_encounters'),
    url(r'^docs/', include('rest_framework_swagger.urls')),
    url(r'^', include(viewsets.router.urls)),
)
