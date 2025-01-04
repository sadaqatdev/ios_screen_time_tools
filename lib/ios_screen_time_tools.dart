import 'package:flutter/services.dart';

class IosScreenTimeTools {
  static const MethodChannel _channel = MethodChannel('ios_screen_time_tools');

  /// Shows the screen for selecting apps to discourage
  Future<String> selectAppsToDiscourage() async {
    try {
      await _channel.invokeMethod('selectAppsToDiscourage');
      return 'App selection screen displayed.';
    } catch (e) {
      return 'Error occurred: $e';
    }
  }

  /// Removes all app restrictions
  Future<String> removeAllRestrictions() async {
    try {
      await _channel.invokeMethod('encourageAll');
      return 'All restrictions removed.';
    } catch (e) {
      return 'Error occurred: $e';
    }
  }

  /// Retrieves screen time usage data
  Future<String> getScreenTimeData() async {
    try {
      final now = DateTime.now();
      final oneWeekAgo = now.subtract(const Duration(days: 7));

      final Map<String, dynamic>? usageData = 
          await _channel.invokeMapMethod<String, dynamic>(
        'getScreenTimeData',
        {
          'startDate': oneWeekAgo.millisecondsSinceEpoch,
          'endDate': now.millisecondsSinceEpoch,
        },
      );

      if (usageData != null && usageData.isNotEmpty) {
        final buffer = StringBuffer();
        buffer.writeln('Start: ${oneWeekAgo.toString()}');
        buffer.writeln('End: ${now.toString()}\n');

        usageData.forEach((app, duration) {
          final hours = duration ~/ 3600;
          final minutes = (duration % 3600) ~/ 60;
          buffer.writeln('$app: ${hours}h ${minutes}m');
        });

        return buffer.toString();
      }
      return 'No usage data found.';
    } catch (e) {
      return 'Error occurred: $e';
    }
  }
} 