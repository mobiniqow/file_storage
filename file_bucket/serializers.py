from rest_framework import serializers
from .models import FileUpload


class FileSerializers(serializers.ModelSerializer):
    
    class Meta:
        model = FileUpload
        fields = "__all__"
