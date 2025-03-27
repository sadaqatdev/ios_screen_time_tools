import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

class IosScreenTime {
  static const MethodChannel _channel = MethodChannel('ios_screen_time');

  Future<String> selectAppsToDiscourage() async {
    try {
      if (!Platform.isIOS) {
        return 'Bu özellik sadece iOS cihazlarda kullanılabilir.';
      }

      await _channel.invokeMethod('selectAppsToDiscourage');
      return 'Uygulama seçim ekranı gösterildi.';
    } catch (e) {
      return 'Hata oluştu: $e';
    }
  }

  /// Tüm uygulama kısıtlamalarını kaldırır
  Future<String> removeAllRestrictions() async {
    try {
      if (!Platform.isIOS) {
        return 'Bu özellik sadece iOS cihazlarda kullanılabilir.';
      }

      await _channel.invokeMethod('encourageAll');
      return 'Tüm kısıtlamalar kaldırıldı.';
    } catch (e) {
      return 'Hata oluştu: $e';
    }
  }

  /// Ekran süresi verilerini getirir
  Future<String> getScreenTimeData() async {
    //

    try {
      //

      if (!Platform.isIOS) {
        return 'Bu özellik sadece iOS cihazlarda kullanılabilir.';
      }

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
        buffer.writeln('Başlangıç: ${oneWeekAgo.toString()}');
        buffer.writeln('Bitiş: ${now.toString()}\n');

        usageData.forEach((app, duration) {
          final hours = (duration as int) ~/ 3600;
          final minutes = ((duration as int) % 3600) ~/ 60;
          buffer.writeln('$app: ${hours}s ${minutes}dk');
        });

        return buffer.toString();
      }
      return 'Kullanım verisi bulunamadı.';
    } catch (e) {
      return 'Hata oluştu: $e';
    }
  }
}
