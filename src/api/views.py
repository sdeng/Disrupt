import json
import uuid
from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from django.views.decorators.csrf import csrf_exempt
from django.core.mail import EmailMultiAlternatives
from django.contrib.auth import logout
from django.template.loader import get_template
from core.models import *
from django.template import Context
from django.conf import settings
from src.athenahealth import athenahealthapi


@api_view(['GET'])
@permission_classes((IsAuthenticated, ))
def account_info(request, *args, **kwargs):
    info = {
        'user_id': request.user.id,
        'user_type': request.user.profile.user_type
    }
    return Response(info, status=status.HTTP_200_OK)

@api_view(['GET'])
@permission_classes((AllowAny,))
def user_lookup(request, *args, **kwargs):
    print 'lookup...'
    return Response(status.HTTP_200_OK)


@api_view(['POST'])
@permission_classes((AllowAny,))
def sync_encounters(request, *args, **kwargs):
    api = athenahealthapi.APIConnection(settings.ATHENAHEALTH_API_VERSION,
                                        settings.ATHENAHEALTH_API_KEY,
                                        settings.ATHENAHEALTH_API_SECRET,
                                        settings.PRACTICE_ID)
    patients = ['1']
    for patient_id in patients:
        encounters = api.GET('/chart/%s/encounters' % patient_id, {'departmentid':settings.DEPARTMENT_ID})
    return Response(status.HTTP_200_OK)
