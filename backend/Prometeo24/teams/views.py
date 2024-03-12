from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import TeamSerializers, PastTeamSerializers
from .models import Team, PastTeam


# Create your views here.
class TeamView(APIView):
    serializer_class = TeamSerializers
    queryset = Team.objects.all()

    def get(self, request):
        allteam = Team.objects.all().order_by('vertical__rank')
        serializer = TeamSerializers(allteam, many=True)
        team = {}
        for team_member in serializer.data:
            if team_member['vertical_name'] not in team:
                team[team_member['vertical_name']] = []
            team[team_member['vertical_name']].append(team_member)
        return Response({"Message": "List of Current-Team", "Current-Team": team})


class PastTeamView(APIView):
    serializer_class = PastTeamSerializers
    queryset = PastTeam.objects.all()

    def get(self, request):
        allpastteam = PastTeam.objects.all().order_by('vertical__rank')
        serializer = PastTeamSerializers(allpastteam, many=True)
        team = {}
        for team_member in serializer.data:
            if team_member['vertical_name'] not in team:
                team[team_member['vertical_name']] = []
            team[team_member['vertical_name']].append(team_member)
        return Response({"Message": "List of Past-Team", "Past-Team": team})