from core.models import Encounter
from src.api.viewsets import router
from rest_framework import serializers, viewsets

class EncounterSerializer(serializers.ModelSerializer):
    class Meta:
        model = Encounter

class EncounterViewSet(viewsets.ModelViewSet):
    queryset = Encounter.objects.all()
    serializer_class = EncounterSerializer

router.register('encounter', EncounterViewSet)