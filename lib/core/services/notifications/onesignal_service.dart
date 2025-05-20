// ignore: file_names
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  static Future<void> init() async{
     OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("88b2010c-05cd-4884-9a32-b9500de41a6c");
  OneSignal.Notifications.requestPermission(true);
  }
}
