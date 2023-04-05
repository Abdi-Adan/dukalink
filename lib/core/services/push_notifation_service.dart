import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as notifications;
import 'package:freshchat_sdk/freshchat_sdk.dart' as fc;
import 'package:dukalink_app/core/di/injector.dart';
import 'package:dukalink_app/core/services/event_bus_utils.dart';
import 'package:dukalink_app/shared/utils/app_events.dart';

import 'fresh_chat_service.dart';

class PushNotificationService {
  FirebaseMessaging? _firebaseMessaging;

  Future init() async {
    _firebaseMessaging = FirebaseMessaging.instance;

    if (Platform.isIOS) {
      // On iOS, this helps to take the user permissions
      await _firebaseMessaging?.requestPermission(
        alert: true,
        badge: true,
        provisional: false,
        sound: true,
      );

      // Enabling foreground notifications
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true, // Required to display a heads up notification
        badge: true,
        sound: true,
      );
    }

    if (Platform.isAndroid) {
      // Enabling foreground notifications
      notifications.AndroidNotificationChannel channel =
          const notifications.AndroidNotificationChannel(
              'high_importance_channel', // id
              'High Importance Notifications', // titleription
              importance: notifications.Importance.max);

      final notifications.FlutterLocalNotificationsPlugin
          flutterLocalNotificationsPlugin =
          notifications.FlutterLocalNotificationsPlugin();

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              notifications.AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }

    await getFcm();

    await _registerListeners();
  }

  Future<String> getFcm() async {
    var token = await _firebaseMessaging?.getToken();
    fc.Freshchat.setPushRegistrationToken(token!);
    return token;
  }

  /* display notification on fore ground */
  static Future<void> _showNotification(
      String? title, String? message, Map<String, dynamic> data) async {
    final flutterLocalNotificationsPlugin =
        notifications.FlutterLocalNotificationsPlugin();

    // set up on clicks
    var androidInit =
        const notifications.AndroidInitializationSettings('notif'); //for logo
    var iosInit = const notifications.IOSInitializationSettings();

    var initSetting = notifications.InitializationSettings(
        android: androidInit, iOS: iosInit);
    await flutterLocalNotificationsPlugin.initialize(initSetting,
        onSelectNotification: (payload) async {
      navigateOnTap(data);
    });

    // display notification
    var android = const notifications.AndroidNotificationDetails(
        'high_importance_channel', 'channel NAME',
        channelDescription: 'CHANNEL DESCRIPTION',
        priority: notifications.Priority.high,
        importance: notifications.Importance.max,
        styleInformation: notifications.BigTextStyleInformation(''),
        icon: 'notif');

    var iOS = const notifications.IOSNotificationDetails();

    var platform =
        notifications.NotificationDetails(android: android, iOS: iOS);

    await flutterLocalNotificationsPlugin.show(0, title, message, platform,
        payload: 'Default_Sound');
  }

  Future<void> _registerListeners() async {
    // fore ground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      //{notification: {title: Bid Awarded, body: Congrats! Your bid of USD 1000 has been selected.}, data: {transporterId: 583, amount: 1000, bidId: 4, push_notification: true}}
      try {
        // data
        inject.get<FreshChatService>().passPushNotificationToFC(message);

        // notification
        if (message.notification != null) {
          await _showNotification(message.notification?.title,
              message.notification?.body, message.data);
        }

        //fire referesh notitcations
        EventBusUtils.getInstance().fire(NotificationReceivedEvent());
      } catch (e) {
        Fimber.e('Error displaying notification', ex: e);
      }
    });

    // For handling notification when the app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessageOpenedApp :$message');
      navigateOnTap(message.data);
    });

    // For handling notification when the app is in terminated state
    var initialMessage = await _firebaseMessaging?.getInitialMessage();
    if (initialMessage != null) {
      print('onInitialMessage :$initialMessage');
      navigateOnTap(initialMessage.data);
    }
    EventBusUtils.getInstance().fire(NotificationReceivedEvent());
  }

  static void navigateOnTap(var data) {
    /*inject<SharedHelper>().getBusinessDetailsData().then((value) {
      if (value != null) {
        if (value.businessId != null && value.businessIndustry != null) {
          navigatorKey.currentState?.pushNamed('NotificationsPage');
        }
      }
    });*/
  }
}
