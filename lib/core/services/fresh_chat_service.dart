import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:injectable/injectable.dart';
import 'package:phone_number/phone_number.dart';
import 'package:dukalink_app/core/data/user/driver_details_response.dart';

class FreshChatService {
  StreamSubscription? restoreStreamSubscription;

  Future<void> initFreshChat() async {
    Freshchat.init(
      dotenv.env['FRESH_CHAT_APP_ID']!,
      dotenv.env['FRESH_CHAT_APP_KEY']!,
      dotenv.env['FRESH_CHAT_DOMAIN']!,
      teamMemberInfoVisible: false,
      cameraCaptureEnabled: true,
      gallerySelectionEnabled: true,
      responseExpectationEnabled: true,
    );
  }

  Future<void> setUser(Driver? driver) async {
    //Set user
    var freshchatUser = await Freshchat.getUser;
    freshchatUser.setFirstName('${driver?.firstName}');
    freshchatUser.setLastName('${driver?.lastName}');
    freshchatUser.setEmail('${driver?.email}');

    var value = await PhoneNumberUtil().parse('${driver?.phoneNumber}');
    freshchatUser.setPhone(value.countryCode, value.nationalNumber);

    Map userProperties = {};
    userProperties['user'] = driver;
    userProperties['device'] = 'Mobile';
    userProperties['clientType'] = Platform.isAndroid ? 'Android' : 'iOS';
    Freshchat.setUserProperties(userProperties);

    //set external id
    Freshchat.identifyUser(externalId: '${driver?.email}');
    //setUser
    Freshchat.setUser(freshchatUser);

    // get restore id
    await fetchRestoreId(driver);
  }

  Future<void> fetchRestoreId(Driver? user) async {
    try {
      if (user?.userId != null) {
        String? restoreId = 'res.data?.token';

        if (restoreId != null) {
          _lookUpAndRestorUser(user, restoreId);
        } else {
          listenToRestoreId(user);
        }
      }
    } catch (_) {}
  }

  void _lookUpAndRestorUser(Driver? user, String? restoreId) async {
    Freshchat.identifyUser(restoreId: restoreId, externalId: '${user?.email}');

    //TODO: add logic to store this token in the db
  }

  void listenToRestoreId(Driver? user) {
    var restoreStream = Freshchat.onRestoreIdGenerated;
    restoreStreamSubscription = restoreStream.listen((event) async {
      var freshchatUser = await Freshchat.getUser;
      Freshchat.setUser(freshchatUser);

      var restoreId = freshchatUser.getRestoreId();
      if (restoreId != null) {
        _lookUpAndRestorUser(user, restoreId);
      }
    });
  }

  Future<Map<dynamic, dynamic>> getUnReadCount() async {
    var unReadCount = await Freshchat.getUnreadCountAsync;
    return unReadCount;
  }

  void resetUser() {
    Freshchat.resetUser();
  }

  void close() {
    restoreStreamSubscription?.cancel();
  }

  Future<void> passPushNotificationToFC(RemoteMessage message) async {
    if (await Freshchat.isFreshchatNotification(message.data)) {
      Freshchat.handlePushNotification(message.data);
    }
  }
}
