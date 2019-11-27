from django.contrib.auth.hashers import make_password
from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(
            required=True,
            validators=[UniqueValidator(queryset=User.objects.all())]
            )
    username = serializers.CharField(
            validators=[UniqueValidator(queryset=User.objects.all())]
            )
    password = serializers.CharField(min_length=8)

    def create(self, validated_data):
        user = User.objects.create_user(validated_data['username'], validated_data['email'],
             validated_data['password'])
        return user

    def get(self, id_user):
        user = {}
        user['id'] = User.objects.get(id=id_user).pk
        user['username'] = User.objects.get(id=id_user).username
        user['email'] = User.objects.get(id=id_user).email
        return user

    def update(self, request):
        user = User.objects.get(pk=request['id'])
        user.username = request['username']
        user.email = request['email']
        user.password = make_password(request['password'])
        user_update = user.save()
        return user_update

    def delete(self, id):
        user = User.objects.get(pk=id)
        result = user.delete()
        return result

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password')
