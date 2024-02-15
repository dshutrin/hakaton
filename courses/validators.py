from django.core.exceptions import ValidationError


def course_preview_validate(field):
	sizes = field.file.image.size
	if (sizes[0] / sizes[1]) != (16 / 9):
		raise ValidationError('Соотношение сторон превью должно равняться 16:9')


def award_image_validate(field):
	sizes = field.file.image.size
	if (sizes[0] / sizes[1]) != 1:
		raise ValidationError('Соотношение сторон превью должно равняться 1:1')
