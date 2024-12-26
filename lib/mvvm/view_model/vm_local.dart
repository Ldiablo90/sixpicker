import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sixpicker/mvvm/model/m_local.dart';
import 'package:sixpicker/mvvm/model/m_picker.dart';

class ViewModelLocal extends Notifier<ModelLocal>{

  void setLocation(Position? position){
    ModelLocal editModel = ModelLocal(latitude: position?.latitude??0, longitude: position?.longitude??0);
    state = editModel;
  }
  void showSnackbar(BuildContext context, {required String title, Color bg = Colors.brown}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(title),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90)),
      backgroundColor: bg,
    ));
  }

  Future<void> locationPermissionCheck(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("위치 권한이 거부되었습니다.");
        showSnackbar(context, title: "Location permission denied");
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print("위치 권한이 영구적으로 거부되었습니다.");
      showSnackbar(context, title: "Location permission has been permanently denied");
    }
  }

  @override
  ModelLocal build() {
    // TODO: implement build
    return ModelLocal();
  }
}

final vmLocal = NotifierProvider<ViewModelLocal, ModelLocal>(ViewModelLocal.new);