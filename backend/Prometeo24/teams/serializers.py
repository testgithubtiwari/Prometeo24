from rest_framework import serializers
from .models import Team, PastTeam


class TeamSerializers(serializers.ModelSerializer):
    class Meta:
        model = Team
        fields = "__all__"

    def to_representation(self, instance):
        rep = super(TeamSerializers, self).to_representation(instance)
        rep['vertical_name'] = instance.vertical.designationName
        return rep


class PastTeamSerializers(serializers.ModelSerializer):
    class Meta:
        model = PastTeam
        fields = "__all__"

    def to_representation(self, instance):
        rep = super(PastTeamSerializers, self).to_representation(instance)
        rep['vertical_name'] = instance.vertical.designationName
        return rep