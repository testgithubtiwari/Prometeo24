from django.contrib import admin
from .models import PreRegister, CustomUser
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin
from import_export.admin import ImportExportModelAdmin
from .resources import PreRegistrationAdminResource


@admin.register(PreRegister)
class PreRegistrationAdmin(ImportExportModelAdmin, admin.ModelAdmin):
    resource_class  =  PreRegistrationAdminResource
    list_display=('name','email','contact')
    search_fields=['name']
    class Meta:
        model = PreRegister
        import_id_fields = ("email",)
        
@admin.register(CustomUser)
class UserAdmin(ImportExportModelAdmin, DjangoUserAdmin):
    """Define admin model for custom User model with no email field."""

    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        (('Personal info'), {'fields': ('first_name', 'last_name' ,'registration_id')}),
        (('Permissions'), {'fields': ('is_active', 'is_staff', 'is_superuser',
                                       'groups', 'user_permissions')}),
        (('Important dates'), {'fields': ('last_login', 'date_joined')}),
        (('Profile'), {'fields': ('college', 'contact', 'city','isProfileCompleted' )}),
        (('Ambassador'), {'fields': ('ambassador', 'referred_by','invite_referral', 'ca_count' )}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2'),
        }),
    )
    list_display = ('email','first_name', 'last_name', 'college', 'ambassador')
    list_filter = ('ambassador', 'college')
    search_fields = ['email', 'first_name', 'last_name', 'college', 'contact', 'city']
    ordering = ('email',)

    class Meta:
        model = CustomUser
        fields = '__all__'