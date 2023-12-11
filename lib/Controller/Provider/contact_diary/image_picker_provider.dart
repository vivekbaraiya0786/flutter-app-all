import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Modals/contact_diary/image_picker_modal.dart';

class ImagePickerProvider extends ChangeNotifier {
  ImagePickerModal imagePickerModal;

  ImagePickerProvider({required this.imagePickerModal});
  ImagePicker imagePicker = ImagePicker();

  putImageFromCamera() async {
    XFile? xfile = await imagePicker.pickImage(source: ImageSource.camera);
    String path = xfile!.path;
    imagePickerModal.image = File(path);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Image', imagePickerModal.image.path);
    notifyListeners();
  }

  putImageFromGallery() async {
    XFile? xfile = await imagePicker.pickImage(source: ImageSource.gallery);
    String path = xfile!.path;
    imagePickerModal.image = File(path);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Image', imagePickerModal.image.path);
    notifyListeners();
  }

  clearPickImage() async {
    imagePickerModal.image = File(" ");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Image', imagePickerModal.image.path);
    notifyListeners();
  }
}
