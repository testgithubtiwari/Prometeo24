from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import SponsorsSerializers 
from .models import Sponsors 


# Create your views here.
class SponsorsView(APIView):
    serializer_class = SponsorsSerializers
    queryset = Sponsors.objects.all()

    def get(self, request):
        allsponsors = Sponsors.objects.all().order_by('designation__rank')
        serializer = SponsorsSerializers(allsponsors, many=True)
        sponsors = {}
        for sponsor in serializer.data:
            if sponsor['designation_name'] not in sponsors:
                sponsors[sponsor['designation_name']] = []
            sponsors[sponsor['designation_name']].append(sponsor)
        return Response({"Message": "List of Sponsors", "Sponsors": sponsors})