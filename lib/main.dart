import 'package:chat_app/core/router/app_router.dart';
import 'package:chat_app/core/translation/intl/app_localizations.dart';
import 'package:chat_app/core/translation/l10n.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/notifications/presentation/notification_repoitories.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp(firebaseOptions: DefaultFirebaseOptions.currentPlatform);
  await initializeNotifications();
  String? fcmToken = await FirebaseMessaging.instance.getToken();
  print('FCM Token: $fcmToken');


  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    await showNotification(message);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {


    await showNotification(message);
  });

  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => "Chat App",
      restorationScopeId: 'app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
    );
  }
}

Future<FirebaseApp?> initializeApp({
  required FirebaseOptions firebaseOptions,
}) async {
  try {
    var app = await Firebase.initializeApp(
      options: firebaseOptions,
    );
    return app;
  } on FirebaseException catch (e) {
    debugPrint('When trying to start firebase, got error: $e');
  }
  return null;
}
