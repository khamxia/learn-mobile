import 'dart:convert';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static String? _fcmToken;
  static String? get fcmToken => _fcmToken;

  static Function(Map<String, dynamic>)? onNotificationTap;
  static Function()? onNewNotification;

  static Future<void> initialize() async {
    final settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('[FCM] permission: ${settings.authorizationStatus}');

    const initSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      ),
    );

    await _notificationsPlugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: _onLocalNotificationTap,
    );

    const channel = AndroidNotificationChannel(
      'default_channel',
      'Default Notifications',
      description: 'Default notification channel',
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleRemoteNotificationTap);

    try {
      _fcmToken = await _firebaseMessaging.getToken();
      print('[FCM] token: $_fcmToken');
    } catch (e) {
      print('[FCM] getToken error: $e');
    }

    _firebaseMessaging.onTokenRefresh.listen((token) {
      _fcmToken = token;
      print('[FCM] token refreshed: $token');
    });
  }

  static void _handleRemoteNotificationTap(RemoteMessage message) {
    print('[FCM] notification tapped (background): ${message.data}');
    onNotificationTap?.call(message.data);
  }

  static void _onLocalNotificationTap(NotificationResponse response) {
    if (response.payload == null) return;
    try {
      final data = jsonDecode(response.payload!) as Map<String, dynamic>;
      onNotificationTap?.call(data);
    } catch (e) {
      print('[FCM] payload parse error: $e');
    }
  }

  // Called only when app is in foreground
  static Future<void> _handleForegroundMessage(RemoteMessage message) async {
    print('[FCM] foreground message: title=${message.notification?.title}  body=${message.notification?.body}');
    await showLocalNotification(
      title: message.notification?.title ?? 'New Notification',
      body: message.notification?.body ?? '',
      data: message.data,
    );
    onNewNotification?.call();
  }

  static Future<void> showLocalNotification({
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'default_channel',
        'Default Notifications',
        channelDescription: 'Default notification channel',
        importance: Importance.high,
        priority: Priority.high,
        showWhen: true,
        enableVibration: true,
        playSound: true,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        interruptionLevel: InterruptionLevel.active,
      ),
    );

    await _notificationsPlugin.show(
      id: Random().nextInt(0x7FFFFFFF),
      title: title,
      body: body,
      notificationDetails: details,
      payload: data != null ? jsonEncode(data) : null,
    );
  }
}
