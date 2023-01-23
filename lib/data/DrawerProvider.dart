import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Providers {
  final DrawerProviider = Provider((_){
    GlobalKey<ScaffoldState> _key = GlobalKey();

    return _key;
  });


}