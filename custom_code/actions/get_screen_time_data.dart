// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:flutter/material.dart';
import 'package:ios_screen_time_tools/ios_screen_time_tools.dart';

Future<String> getScreenTimeData() async {
  try {
    final screenTime = IosScreenTimeTools();
    final result = await screenTime.getScreenTimeData();
    
    // Debug için konsola yazdır
    print('Screen Time Data Result:');
    print(result);
    
    /* Örnek çıktı şöyle olacak:
    Start: 2024-01-10 12:34:56.789
    End: 2024-01-17 12:34:56.789

    com.apple.mobilesafari: 2h 30m
    com.facebook.messenger: 1h 45m
    com.instagram.ios: 3h 15m
    */
    
    return result;
  } catch (e) {
    print('Error getting screen time data: $e');
    return 'Error: $e';
  }
} 