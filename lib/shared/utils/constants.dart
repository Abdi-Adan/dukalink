import 'package:rxdart/subjects.dart';

String languageKey = "selectedLanguageKey";
String authTokenKey = "authTokenKey";

BehaviorSubject<bool> isQRScanned = BehaviorSubject.seeded(false);
 BehaviorSubject<String> tableID =
              BehaviorSubject.seeded('');
