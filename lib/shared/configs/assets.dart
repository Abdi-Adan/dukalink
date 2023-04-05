// ignore_for_file: constant_identifier_names

import 'dart:math';

class Assets {
  //
  //pngs

  static const String logoIcon = 'assets/images/.png';
  static const String qrcode = 'assets/images/qr.png';

  //svgs
  static const String logo = 'assets/images/logo.svg';
  static const String finger_scan = 'assets/images/finger-scan.svg';

  static const String finger_scan_icon = 'assets/icons/finger_print_scan.svg';
  static const String closeCircle = 'assets/icons/close-circle.svg';
  static const String tickCircle = 'assets/icons/tick-circle.svg';
  static const String notificationIcon = 'assets/icons/notification.svg';
  static const String notificationBell = 'assets/icons/notification_bell.svg';
  static const String qrScan = 'assets/icons/scan.svg';
  static const String reserver = 'assets/icons/reserve.svg';
  static const String pay_card = 'assets/images/card-pos.svg';
  static const String dinIn = 'assets/images/dineInsvg.svg';
  static const String dinInColored = 'assets/images/dineInColored.svg';
  static const String takeAway = 'assets/images/takeAway.svg';
  static const String takeAwayColored = 'assets/images/takeAwayColored.svg';
  static const String loading = 'assets/images/loading.svg';
  static const String mpesa = 'assets/images/mpesa.svg';
  static const String greenTick = 'assets/images/greentick.svg';

  static const String home = 'assets/images/home.svg';
  static const String favorite = 'assets/images/favorite.svg';
  static const String orderHistory = 'assets/images/order_history.svg';

  static const String editIcon = 'assets/icons/edit-2.svg';
  static const String splitIcon = 'assets/icons/split.svg';
  static const String cardsIcon = 'assets/icons/cards.svg';
  static const String ordersIcon = 'assets/icons/myorders.svg';
  static const String logoutIcon = 'assets/icons/logout.png';
}

String sampleAvator =
    'https://source.unsplash.com/random/300x200?sig=${Random().nextInt(1000)}';
String sampleImage =
    'https://picsum.photos/500/300?random=${Random().nextInt(100)}';
String launcherIcon =
    "https://firebasestorage.googleapis.com/v0/b/dukalink.appspot.com/o/images%2Favatars%2Flaunch_icon.png?alt=media&token=19fccc59-56c0-44c4-9335-e6d3b0202129";
images(int index) {
  return 'https://picsum.photos/500/300?random=$index';
}
