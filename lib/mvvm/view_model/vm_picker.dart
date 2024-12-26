import 'dart:async';
import 'dart:math';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sixpicker/mvvm/model/m_picker.dart';
import 'package:sixpicker/mvvm/view_model/vm_bill.dart';
import 'package:sixpicker/mvvm/view_model/vm_local.dart';

class ViewModelPicker extends Notifier<ModelPicker> {

  ModelPicker get editModel => ModelPicker(seed: state.seed, pickData: state.pickData);

  void init() => state = ModelPicker();

  void initSeed() => state = ModelPicker(pickData: state.pickData);

  void initPickData() {ref.read(vmBill.notifier).setPage(0);state = ModelPicker();}

  void setPickType(int? index) => state = ModelPicker(seed: state.seed,pickType: index??0, pickData: state.pickData,ymd: state.ymd);

  void setSeed(BuildContext context, {required String seed}) {
    ref.read(vmBill.notifier).setPage(0);
    FocusManager.instance.primaryFocus?.unfocus();
    ref.read(vmLocal.notifier).showSnackbar(context, title: "The seed value has been saved");
    state = ModelPicker(seed: seed);
  }

  void setPickData(BuildContext context) async {
    ref.read(vmBill.notifier).setPage(1);
    if(state.pickType == 0) {
      ref.read(vmLocal.notifier).showSnackbar(context, title: "Please choose the type");
      return;
    }
    List<int> numbers = List.generate(45, (index) => index + 1);
    bool isLocationServiceEnabled  = await Geolocator.isLocationServiceEnabled();
    int locationNum = 0;
    int time = int.parse(DateTimeFormat.format(DateTime.now(), format: "YmdHis"));
    if(isLocationServiceEnabled){
      final LocationSettings locationSettings = LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 10);
      Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
      try{
        ref.read(vmLocal.notifier).setLocation(position);
        locationNum = int.parse(position!.latitude.toString().replaceAll(".", ""));
        locationNum += int.parse(position.longitude.toString().replaceAll(".", ""));
      }catch(e){}
    }
    if(state.pickType == 1) {time = 0;locationNum = 0;}
    else if(state.pickType == 2) {locationNum = 0;}
    else if(state.pickType == 3) {time = 0;}
    Random random = Random((int.tryParse(state.seed)??0)+time+locationNum);
    final List<List<int>> pickLists = [];
    while (pickLists.length < 5) {
      numbers.shuffle(random);
      final pickData = numbers.take(6).toList()..sort();
      pickLists.add(pickData);
    }
    state = ModelPicker(seed: state.seed, pickType: state.pickType, pickData: pickLists, ymd: DateTimeFormat.format(DateTime.now(), format: "Y-m-d H:i:s"));
  }

  @override
  ModelPicker build() {
    // TODO: implement build
    return ModelPicker();
  }
}

final vmPicker =
    NotifierProvider<ViewModelPicker, ModelPicker>(ViewModelPicker.new);
