// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:screen_time_api_ios/screen_time_api_ios.dart';

Future<String> fetchScreenTimeData() async {
  try {
    if (!Platform.isIOS) {
      return 'Bu özellik sadece iOS cihazlarda kullanılabilir.';
    }

    final screenTimeAPI = ScreenTimeApiIos();
    
    // Son 7 günün verilerini al
    final now = DateTime.now();
    final oneWeekAgo = now.subtract(const Duration(days: 7));
    
    // Ekran süresi verilerini çek
    final usageData = await screenTimeAPI.getScreenTimeData(oneWeekAgo, now);
    
    // Veriyi daha okunabilir bir formatta döndür
    if (usageData != null) {
      return '''
Başlangıç: ${oneWeekAgo.toString()}
Bitiş: ${now.toString()}
Kullanım Verileri: $usageData
''';
    } else {
      return 'Kullanım verisi bulunamadı.';
    }

  } catch (e) {
    return 'Hata oluştu: $e';
  }
} 