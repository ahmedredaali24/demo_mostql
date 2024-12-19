import 'package:firebase_messaging/firebase_messaging.dart';

class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // دالة للحصول على التوكين
  Future<void> getToken() async {
    String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      print("FCM Token: $token");
      // يمكنك إرسال التوكين إلى الخادم أو تخزينه في قاعدة بيانات محلية
    } else {
      print("Failed to get FCM Token.");
    }
  }

  Future<void> setupTokenRefresh() async {
    _firebaseMessaging.onTokenRefresh.listen((String newToken) {
      print("Token refreshed: $newToken");
      // يمكنك إرسال التوكين الجديد إلى الخادم أو تحديثه في قاعدة البيانات
    });
  }
}
