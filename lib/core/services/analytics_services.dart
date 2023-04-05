import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:dukalink_app/core/data/user/driver_details_response.dart';
import 'package:dukalink_app/core/di/injector.dart';
import 'package:dukalink_app/shared/utils/utils.dart';

class AnalyticsServices {
  static Future<void> initAnalytics() async {
    var flavor = await getAppFlavor();

    var mixpanel = inject.get<Mixpanel>();

    mixpanel.getDistinctId();

    try {
      //init events
      await const MethodChannel('com.sendyit.fulfilment').invokeMethod<String>(
          'segmentAnalyticsTrack',
          {'event': 'Application Opened', 'properties': {}});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static setUser(Driver driver) async {
    var mixpanel = inject.get<Mixpanel>();

    mixpanel.identify('${driver.userId}');

    mixpanel
        .getPeople()
        .set('\$name', '${driver.firstName} ${driver.lastName}');
    mixpanel.getPeople().set('\$email', driver.email);

    mixpanel.getPeople().set('\$UserDetails', driver.toJson());

    mixpanel.registerSuperProperties(
      {
        'user': driver.toJson(),
        'clientType': Platform.isAndroid ? 'Android' : 'iOS',
        'device': 'Mobile'
      },
    );
  }

  static trackEvent(String eventName, Map<String, dynamic>? properties) {
    try {
      var mixpanel = inject.get<Mixpanel>();
      mixpanel.track(eventName, properties: properties);
    } catch (e) {
      debugPrint('analytics error ${e.toString()}');
    }
  }

  static trackEventByName(
    String eventName,
  ) async {
    try {
      var mixpanel = inject.get<Mixpanel>();
      mixpanel.track(eventName);
    } catch (e) {
      debugPrint('analytics error ${e.toString()}');
    }
  }

  static analyticsFlush() async {
    try {
      var mixpanel = inject.get<Mixpanel>();
      mixpanel.flush();
    } catch (e) {
      debugPrint('analytics error ${e.toString()}');
    }
  }
}
