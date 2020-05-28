from django.db import models

# Create your models here.
class ShoppingCart(models.Model):
    customer_id = models.IntegerField(primary_key=True)
    goods_id = models.CharField(max_length=10)
    quantity = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'shopping_cart'
        unique_together = (('customer_id', 'goods_id'),)

