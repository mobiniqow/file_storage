from django.urls import path
from .views import FileView

urlpatterns = [
    path('files/', FileView.as_view(), name='file-create'),  # برای ایجاد فایل
    path('files/<int:pk>/', FileView.as_view(), name='file-retrieve'),  # برای دریافت فایل
]