from django.shortcuts import render
from rest_framework.generics import CreateAPIView,RetrieveAPIView
from .serializers import FileSerializers
from .models import FileUpload

class FileView(CreateAPIView,RetrieveAPIView):
    serializer_class = FileSerializers
    queryset = FileUpload.objects.all()