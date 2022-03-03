from django import forms
from .models import Email, Contacts, Label


class ComposeForm(forms.ModelForm):
    """Form for the new email model"""

    class Meta:
        model = Email
        fields = ['receiver', 'cc', 'bcc', 'subject', 'body', 'file']


class ReplyForm(forms.ModelForm):
    class Meta:
        model = Email
        fields = ('body', 'file')
        widgets = {
            'body': forms.Textarea(attrs={'class': 'form-control'})
        }


class NewContactForm(forms.ModelForm):
    """Form for the new contact model"""

    class Meta:
        model = Contacts
        fields = ['name', 'email', 'phone_number', 'birth_date']


class NewLabelForm(forms.ModelForm):
    """Form for the new label model"""

    class Meta:
        model = Label
        fields = ['title']


class SearchForm(forms.Form):
    search = forms.CharField()