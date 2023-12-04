import 'dart:io';

abstract class ImageUploadEvent {}

class ImageSelectedEvent extends ImageUploadEvent {
  final File imageFile;

  ImageSelectedEvent(this.imageFile);
}
