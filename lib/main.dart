import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:learn_app/pages/dashboard/dashboard_page.dart';
import 'package:learn_app/pages/home/provider/home_logic.dart';
import 'package:learn_app/pages/login/login_page.dart';
import 'package:learn_app/pages/login/provider/login_logic.dart';
import 'package:learn_app/pages/order/provider/order_logic.dart';
import 'package:learn_app/pages/splash/splash_page.dart';
import 'package:learn_app/services/notification_service.dart';
import 'package:provider/provider.dart';

// Background message handler (must be top-level function)
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((v) {
    print('firebase initial complete');
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  try {
    await NotificationService.initialize();
  } catch (e) {
    print('NotificationService initialize error: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeLogic()),
        ChangeNotifierProvider(create: (context) => LoginLogic()),
        ChangeNotifierProvider(create: (context) => OrderLogic()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Learn App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          fontFamily: "NotoSansLao",
        ),
        home: SplashPage(),
        // home: DashboardPage(),
      ),
    );
  }
}
