import re
from rest_framework_extensions.routers import ExtendedDefaultRouter

router = ExtendedDefaultRouter(trailing_slash=False)

from src.api.viewsets.encounter import *