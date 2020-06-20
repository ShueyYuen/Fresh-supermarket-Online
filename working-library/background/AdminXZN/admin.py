from django.contrib import admin
from Fresh_market_online.model import Goods, Order, Warehouse, Deliveryman, User

# Register your models here.
admin.site.site_title = '鲜着呢后台管理系统'
admin.site.site_header = '鲜着呢后台管理系统'


# 商品管理
class GoodsAdmin(admin.ModelAdmin):
    list_display = [
        'goods_id', 'goods_name', 'goods_type', 'unit', 'price', 'warehouse_id', 'stock', 'origin', 'specification',
        'packaging', 'stockway', 'weight', 'discount', 'subtitle', 'distribution', 'promotion', 'tags_type',
        'tags_content']
    list_filter = ['goods_type', 'origin', 'subtitle']
    list_per_page = 15
    actions = ['love_yx']

    def love_yx(self):
        pass

    love_yx.action_type = 2
    love_yx.action_url = 'https://github.com/FredCof'
    love_yx.short_description = '❤ 袁学哥哥'
    love_yx.type = 'success'

    def get_queryset(self, request):
        qs = super(GoodsAdmin, self).get_queryset(request)
        if request.user.username == ('1' or '2' or '3' or '4' or '5'):
            warehouse_id = Warehouse.objects.get(admin_id=request.user.username).warehose_id
            return qs.filter(warehouse_id=warehouse_id)
        else:
            return qs


admin.site.register(Goods, GoodsAdmin)


# 订单管理
class OrderAdmin(admin.ModelAdmin):
    list_display = ['order_id', 'customer_id', 'deliveryman_id', 'create_order_time',
                    'receive_order_time', 'finish_order_time', 'order_status',
                    'payment_id', 'address_id', 'warehouse_id', 'display_status', 'remarks']
    list_filter = ['create_order_time']

    def get_queryset(self, request):
        qs = super(OrderAdmin, self).get_queryset(request)
        if request.user.username == ('1' or '2' or '3' or '4' or '5'):
            warehouse_id = Warehouse.objects.get(admin_id=request.user.username).warehose_id
            return qs.filter(warehouse_id=warehouse_id)
        else:
            return qs


admin.site.register(Order, OrderAdmin)


# 仓库管理
class WarehouseAdmin(admin.ModelAdmin):
    list_display = ['warehose_id', 'address', 'admin_id', 'warehouse_name']

    def get_queryset(self, request):
        qs = super(WarehouseAdmin, self).get_queryset(request)
        if request.user.username == ('1' or '2' or '3' or '4' or '5'):
            return qs.filter(admin_id=request.user.username)
        else:
            return qs


admin.site.register(Warehouse, WarehouseAdmin)


class DeliverymanAdmin(admin.ModelAdmin):
    list_display = ['deliveryman_id', 'warehouse_id', 'taking_status']

    def get_queryset(self, request):
        qs = super(DeliverymanAdmin, self).get_queryset(request)
        if request.user.username == ('1' or '2' or '3' or '4' or '5'):
            warehouse_id = Warehouse.objects.get(admin_id=request.user.username).warehose_id
            return qs.filter(warehouse_id=warehouse_id)
            # return qs.filter(warehouse_id=request.user.username)
        else:
            return qs


admin.site.register(Deliveryman, DeliverymanAdmin)


class UserAdmin(admin.ModelAdmin):
    list_display = ['user_id', 'user_type', 'password', 'sex', 'phone', 'head_image_id',
                    'nickname', 'token', 'money']
    list_filter = ['user_type', 'sex']


admin.site.register(User, UserAdmin)
