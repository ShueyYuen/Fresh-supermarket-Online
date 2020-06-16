# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Address(models.Model):
    customer_id = models.IntegerField()
    address_id = models.AutoField(primary_key=True)
    province = models.CharField(max_length=255, blank=True, null=True)
    consignee = models.CharField(max_length=255)
    consignee_phone = models.CharField(max_length=255)
    consignee_sex = models.CharField(max_length=10, blank=True, null=True)
    house_no = models.CharField(max_length=255)
    longitude = models.FloatField(blank=True, null=True)
    latitude = models.FloatField(blank=True, null=True)
    tag = models.CharField(max_length=10, blank=True, null=True)
    city = models.CharField(max_length=255, blank=True, null=True)
    district = models.CharField(max_length=255, blank=True, null=True)
    street = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'address'
        unique_together = (('address_id', 'customer_id', 'house_no'),)


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group_id', 'permission_id'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type_id = models.IntegerField()
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type_id', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user_id = models.IntegerField()
    group_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user_id', 'group_id'),)


class AuthUserUserPermissions(models.Model):
    user_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user_id', 'permission_id'),)


class Deliveryman(models.Model):
    deliveryman_id = models.IntegerField(primary_key=True)
    warehouse_id = models.CharField(max_length=20, blank=True, null=True)
    taking_status = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'deliveryman'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField(blank=True, null=True)
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type_id = models.IntegerField(blank=True, null=True)
    user_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'django_session'


class Goods(models.Model):
    goods_id = models.AutoField(primary_key=True)
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


class History(models.Model):
    user_id = models.IntegerField()
    key = models.CharField(max_length=255, blank=True, null=True)
    time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'history'


class Order(models.Model):
    order_id = models.AutoField(primary_key=True)
    customer_id = models.IntegerField()
    deliveryman_id = models.IntegerField(blank=True, null=True)
    create_order_time = models.DateTimeField(blank=True, null=True)
    receive_order_time = models.DateTimeField(blank=True, null=True)
    finish_order_time = models.DateTimeField(blank=True, null=True)
    order_status = models.IntegerField()
    payment_id = models.CharField(max_length=255)
    address_id = models.IntegerField()
    warehouse_id = models.CharField(max_length=10)
    display_status = models.TextField(blank=True, null=True)  # This field type is a guess.
    remarks = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'order'


class OrderDetail(models.Model):
    order_id = models.IntegerField()
    goods_id = models.CharField(max_length=10, blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'order_detail'
        unique_together = (('id', 'order_id'),)


class Purchase(models.Model):
    purchase_id = models.AutoField(primary_key=True)
    purchase_time = models.DateTimeField(blank=True, null=True)
    buying_price = models.DecimalField(max_digits=10, decimal_places=2)
    buying_number = models.DecimalField(max_digits=10, decimal_places=2)
    purchase_status = models.CharField(max_length=10, blank=True, null=True)
    goods_id = models.CharField(max_length=10)
    warehouse_id = models.CharField(max_length=20)
    guarantee_period = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'purchase'


class Recycle(models.Model):
    user_id = models.IntegerField(blank=True, null=True)
    phone = models.CharField(max_length=255, blank=True, null=True)
    address_id = models.IntegerField(blank=True, null=True)
    province = models.CharField(max_length=45, blank=True, null=True)
    consignee = models.CharField(max_length=45, blank=True, null=True)
    consignee_phone = models.CharField(max_length=45, blank=True, null=True)
    consignee_sex = models.CharField(max_length=45, blank=True, null=True)
    house_no = models.CharField(max_length=45, blank=True, null=True)
    latitude = models.CharField(max_length=45, blank=True, null=True)
    longitude = models.CharField(max_length=45, blank=True, null=True)
    tag = models.CharField(max_length=45, blank=True, null=True)
    city = models.CharField(max_length=45, blank=True, null=True)
    district = models.CharField(max_length=45, blank=True, null=True)
    street = models.CharField(max_length=45, blank=True, null=True)
    order_id = models.CharField(primary_key=True, max_length=32)
    deliveryman_id = models.IntegerField(blank=True, null=True)
    warehouse_id = models.CharField(max_length=45, blank=True, null=True)
    finish_order_time = models.CharField(max_length=45, blank=True, null=True)
    remarks = models.CharField(max_length=45)
    goods_id = models.CharField(max_length=45, blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)
    order_status = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'recycle'


class Schedule(models.Model):
    schedule_id = models.AutoField(primary_key=True)
    schedule_start_time = models.DateTimeField(blank=True, null=True)
    schedule_finish_time = models.DateTimeField(blank=True, null=True)
    from_field = models.CharField(db_column='from', max_length=20, blank=True, null=True)  # Field renamed because it was a Python reserved word.
    to = models.CharField(max_length=20, blank=True, null=True)
    schedule_status = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'schedule'


class ScheduleDetail(models.Model):
    schedule_id = models.IntegerField(primary_key=True)
    goods_id = models.CharField(max_length=10)
    number = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'schedule_detail'
        unique_together = (('schedule_id', 'goods_id'),)


class ShoppingCart(models.Model):
    customer_id = models.IntegerField(primary_key=True)
    goods_id = models.CharField(max_length=10)
    quantity = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'shopping_cart'
        unique_together = (('customer_id', 'goods_id'),)


class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    user_type = models.CharField(max_length=10)
    password = models.CharField(max_length=32)
    sex = models.CharField(max_length=10, blank=True, null=True)
    phone = models.CharField(unique=True, max_length=255)
    head_image_id = models.CharField(max_length=32, blank=True, null=True)
    nickname = models.CharField(max_length=255, blank=True, null=True)
    token = models.CharField(max_length=255, blank=True, null=True)
    money = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'user'
        unique_together = (('user_id', 'phone'),)


class Warehouse(models.Model):
    warehose_id = models.CharField(primary_key=True, max_length=20)
    address = models.CharField(max_length=255)
    admin_id = models.IntegerField()
    warehouse_name = models.CharField(max_length=20, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'warehouse'