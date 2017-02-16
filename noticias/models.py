from django.db import models
from django.contrib.auth.models import User

from ckeditor.fields import RichTextField


class Noticia(models.Model):
    user = models.ForeignKey(User, editable = False)
    title = models.CharField(max_length=150)
    time = models.DateTimeField(auto_now_add=True)
    content = RichTextField()
    image = models.ImageField(blank=True)

    class Meta:
        ordering = ('-time',)

    def __str__(self):
        return str(self.title)
