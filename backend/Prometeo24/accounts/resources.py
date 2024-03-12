from import_export import resources
from .models import PreRegister

class PreRegistrationAdminResource(resources.ModelResource):

    class Meta:
        model   =   PreRegister
        # exclude = ('id',)
        import_id_fields = ("email",)