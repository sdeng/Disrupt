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


@api_view(['GET'])
@permission_classes((IsAuthenticated, ))
def account_info(request, *args, **kwargs):
    info = {
        'user_id':request.user.id,
    }
    return Response(info, status=status.HTTP_200_OK)

@api_view(['GET'])
@permission_classes((AllowAny,))
def user_lookup(request, *args, **kwargs):
    print 'lookup...'
    return Response(status.HTTP_200_OK)

