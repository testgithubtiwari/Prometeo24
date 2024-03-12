from rest_framework import serializers
from .models import Sponsors


class SponsorsSerializers(serializers.ModelSerializer):
    class Meta:
        model = Sponsors
        fields = "__all__"

    def to_representation(self, instance):
        rep = super(SponsorsSerializers, self).to_representation(instance)
        rep['designation_name'] = instance.designation.sponsor_type
        return rep
