import re
from rest_framework_extensions.routers import ExtendedDefaultRouter
from core.models import *


router = ExtendedDefaultRouter(trailing_slash=False)