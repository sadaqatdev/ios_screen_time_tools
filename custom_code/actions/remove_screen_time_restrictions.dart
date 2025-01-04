// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:screen_time_api_ios/screen_time_api_ios.dart';

Future<String> removeScreenTimeRestrictions() async {
  try {
    if (!Platform.isIOS) {
      return 'Bu özellik sadece iOS cihazlarda kullanılabilir.';
    }

    final screenTimeApiIos = ScreenTimeApiIos();
    
    // Tüm kısıtlamaları kaldır
    await screenTimeApiIos.encourageAll();
    return 'Tüm kısıtlamalar kaldırıldı.';
    
  } catch (e) {
    return 'Hata oluştu: $e';
  }
} 