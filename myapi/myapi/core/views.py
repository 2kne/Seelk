from django.http import HttpResponse, JsonResponse
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from myapi.core.serializers import UserSerializer
from django.contrib.auth.models import User

from myapi.coin_alert.alert import CoinAlert


class User(APIView):

    #permission_classes = [IsAuthenticated]

    """
    Creates the user.
    """

    def put(self, request, format='json'):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            if user:
                return Response(serializer.data, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


    def get(self, request, id_user, format='json'):
        serializer = UserSerializer(data=request.data)
        user = serializer.get(id_user)
        print(user)
        if user:
            alert = CoinAlert()
            user['alert'] = alert.get_relation(id_user)
            return JsonResponse(user, safe=False)


    def post(self, request, format='json'):
        serializer = UserSerializer(data=request.data)
        user = serializer.update(request.data)
        return HttpResponse(user, status=status.HTTP_201_CREATED)

    def delete(self, request):
        serializer = UserSerializer(data=request.data)
        result = serializer.delete(request.data['id'])
        return Response(result)


