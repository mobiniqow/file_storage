from django.db import models

# Create your models here.

class FileUpload(models.Model):
    item = models.FileField(upload_to="files/")