from django.urls import path
from rest_framework.authtoken.views import obtain_auth_token

from . import views

from django.views.decorators.csrf import csrf_exempt

app_name = 'mail_page'
urlpatterns = [
    # path('home/', views.home, name='home'),
    path('compose/', views.ComposeEmail.as_view(), name='compose'),
    # signature
    path('newsignature/', views.NewSignature.as_view(), name='newsignature'),
    path('showsignature/', views.ShowSignature.as_view(), name='showsignature'),
    path('deletesignature/<int:id>', views.DeleteSignature.as_view(), name='deletesignature'),
    # path('inbox/', views.Inbox.as_view(), name='inbox'),
    path('inbox/', views.Inbox.as_view(), name='home'),
    path('detail/<int:id>', views.DetailEmail.as_view(), name='detail'),
    path('sent/', views.SentEmail.as_view(), name='sent'),
    path('draftbox/', views.DraftBox.as_view(), name='draftbox'),
    path('createdraft/', views.CreateDraft.as_view(), name='createdraft'),
    path('detaildraft/<int:id>', views.DetailDraft.as_view(), name='detaildraft'),
    path('reply/<int:email_id>', views.reply_email, name='reply'),
    path('showcontacts/', views.ShowContacts.as_view(), name='showcontacts'),
    path('newcontacts/', views.NewContacts.as_view(), name='newcontacts'),
    path('detailcontacts/<int:id>', views.DetailContacts.as_view(), name='detailcontacts'),
    path('deletecontacts/<int:id>', views.DeleteContacts.as_view(), name='deletecontacts'),
    path('updatecontacts/<int:id>', views.UpdateContacts.as_view(), name='updatecontacts'),
    path('emailcontact/<int:id>', views.EmailContact.as_view(), name='emailcontact'),
    # path('emailcontact/<int:id>', views.emailcontct, name='emailcontact'),
    path('contactscsv/', views.contact_csv, name='contactscsv'),
    path('newlabel/', views.NewLabel.as_view(), name='newlabel'),
    path('showlabel/', views.ShowLabel.as_view(), name='showlabel'),
    path('trash/<int:id>', views.Trash.as_view(), name='trash'),
    path('trashbox/', views.TrashBox.as_view(), name='trashbox'),
    path('archive/<int:id>', views.Archive.as_view(), name='archive'),
    path('archivebox/', views.ArchiveBox.as_view(), name='archivebox'),
    path('deleteemail/<int:id>', views.DeleteEmail.as_view(), name='deleteemail'),
    path('forward/<int:id>', views.ForwardEmail.as_view(), name='forward'),
    path('addlabel/<int:email_id>/<int:label_id>', views.AddLabel.as_view(), name='addlabel'),
    path('labeldetail/<int:id>', views.LabelDetail.as_view(), name='labeldetail'),
    path('deletelabel/<int:id>', views.DeleteLabel.as_view(), name='deletelabel'),
    # path('searchemail/', csrf_exempt(views.search_email), name='searchemail'),
    path('filteremail/', views.FilterEmail.as_view(), name='filteremail'),
    path('alpine/', views.FilterAlpineJs.as_view(), name='alpine'),
    path('api-token-auth/', obtain_auth_token, name='api_token_auth'),
    path('contacts-api/', views.ContactsApiView.as_view(), name='contacts-api'),
    path('emails-api/', views.EmailsApiView.as_view(), name='emails-api'),
]
