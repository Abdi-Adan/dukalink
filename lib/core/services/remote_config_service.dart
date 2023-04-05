import 'dart:convert';

import 'package:easy_localization/src/public_ext.dart';
import 'package:fimber/fimber.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  static RemoteConfigService? _instance;

  static Future<RemoteConfigService> getInstance() async {
    if (_instance == null) {
      var _settings = RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      );
      var instance = RemoteConfigService(
        remoteConfig: FirebaseRemoteConfig.instance,
      );
      _instance = instance;
      await _instance?._remoteConfig.setConfigSettings(_settings);
    }
    return _instance!;
  }

  Future initialise() async {
    try {
      await _fetchAndActivate();
    } catch (exception) {
      Fimber.e('remoteConfigError'.tr());
    }
  }

  Future setDefaults() async {
    try {
      await _remoteConfig.setDefaults(<String, dynamic>{
        'default_country_components_places':
            'components=country:KE|country:NGA|country:EGY',
        'supported_countries': 'KE,NG,EG,US',
        'support_phone_number': '+25470XXXXXXXX',
      });
    } catch (exception) {
      throw 'remoteConfigError'.tr();
    }
  }

  Future _fetchAndActivate() async {
    await _remoteConfig.fetchAndActivate();
  }

  RemoteConfigService({required FirebaseRemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  Future<String> getSupportPhoneNumber() async {
    await _fetchAndActivate();
    return _remoteConfig.getString('Constants.supportPhoneNumber');
  }
}
