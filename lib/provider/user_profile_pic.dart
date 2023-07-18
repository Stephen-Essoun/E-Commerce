import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UsersPic extends ChangeNotifier{
  File? _imagePath;
  final String _imageStringPath ='images/avatar.png';
  String get imagePath =>_imageStringPath;
  File? get imagePickPath =>_imagePath;
  pickImage()async{
    try{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null)return;
    _imagePath = File(image.path);
    }on PlatformException catch (e){
      log('$e');
    }
  }
}