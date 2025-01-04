// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:flutter/material.dart';
import 'package:ios_screen_time_tools/ios_screen_time_tools.dart';

Future<String> removeRestrictions() async {
  final screenTime = IosScreenTimeTools();
  return await screenTime.removeAllRestrictions();
} 