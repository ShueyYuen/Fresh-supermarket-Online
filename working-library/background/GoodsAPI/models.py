from django.db import models

# Create your models here.
class Goods(models.Model):
    goods_id = models.CharField(primary_key=True, max_length=10)
    goods_name = models.CharField(max_length=20, blank=True, null=True)
    goods_type = models.CharField(max_length=10, blank=True, null=True)
    unit = models.CharField(max_length=10, blank=True, null=True)
    price = models.FloatField(blank=True, null=True)
    warehouse_id = models.CharField(max_length=20, blank=True, null=True)
    stock = models.FloatField(blank=True, null=True)
    origin = models.CharField(max_length=255, blank=True, null=True)
    specification = models.CharField(max_length=255)
    packaging = models.CharField(max_length=255, blank=True, null=True)
    stockway = models.CharField(max_length=255, blank=True, null=True)
    weight = models.FloatField()
    discount = models.FloatField()
    subtitle = models.CharField(max_length=255, blank=True, null=True)
    distribution = models.CharField(max_length=255, blank=True, null=True)
    promotion = models.CharField(max_length=255, blank=True, null=True)
    tags_type = models.CharField(max_length=255, blank=True, null=True)
    tags_content = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'goods'

