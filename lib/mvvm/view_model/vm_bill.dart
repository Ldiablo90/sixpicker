import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sixpicker/mvvm/model/m_picker.dart';

class ViewModelBill extends Notifier<int>{

  void init() => state = 0;

  void setPage(int page) => state = page;

  @override
  int build() {
    // TODO: implement build
    return 1;
  }
}

final vmBill = NotifierProvider<ViewModelBill, int>(ViewModelBill.new);