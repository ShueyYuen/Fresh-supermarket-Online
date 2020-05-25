from django.db import models

# Create your models here.
class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    user_type = models.CharField(max_length=10)
    username = models.CharField(max_length=20)
    password = models.CharField(max_length=32)
    sex = models.IntegerField(blank=True, null=True)
    phone = models.CharField(unique=True, max_length=255)
    head_image_id = models.CharField(max_length=32, blank=True, null=True)
    nickname = models.CharField(max_length=255, blank=True, null=True)
    token = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'user'
        unique_together = (('user_id', 'phone'),)
