import 'package:flutter_easyloading/flutter_easyloading.dart';

startLoading(String message) {
  return EasyLoading.show(
    status: message,
    maskType: EasyLoadingMaskType.black,
  );
}

stopLoading() {
  return EasyLoading.dismiss();
}

//form validating
validator(value) {
  if (value.isEmpty) {
    return "Field can't be empty";
  }
}