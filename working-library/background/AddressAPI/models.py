from django.db import models

# Create your models here.
class Address(models.Model):
    customer_id = models.IntegerField()
    address_id = models.AutoField(primary_key=True)
    province = models.CharField(max_length=255, blank=True, null=True)
    consignee = models.CharField(max_length=255)
    consignee_phone = models.CharField(max_length=255)
    consignee_sex = models.CharField(max_length=10, blank=True, null=True)
    house_no = models.CharField(max_length=255)
    longitude = models.CharField(max_length=255, blank=True, null=True)
    latitude = models.CharField(max_length=255, blank=True, null=True)
    tag = models.CharField(max_length=10, blank=True, null=True)
    city = models.CharField(max_length=255, blank=True, null=True)
    district = models.CharField(max_length=255, blank=True, null=True)
    street = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'address'
        unique_together = (('address_id', 'customer_id', 'house_no'),)

