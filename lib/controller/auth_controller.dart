import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  // Private Fields
  RxString _fullName = "মোঃ মোহাইমেনুল রেজা".obs;
  RxString _companyName = "সফটবিডি লিমিটেড".obs;
  RxString _location = "ঢাকা".obs;
  ValueNotifier<XFile?> _imageFile = ValueNotifier<XFile?>(null);

  // Getters
  String get fullName => _fullName.value;
  String get companyName => _companyName.value;
  String get location => _location.value;
  XFile? get imageFile => _imageFile.value;

  // Setters
  void setFullName(String value) {
    _fullName.value = value;
    update();
  }

  void setCompanyName(String value) {
    _companyName.value = value;
    update();
  }

  void setLocation(String value) {
    _location.value = value;
    update();
  }

  void setImageFile(XFile? value) {
    _imageFile.value = value;
    update();
  }

  @override
  void onClose() {
    _imageFile
        .dispose(); // Dispose the ValueNotifier when the controller is closed
    super.onClose();
  }
}
