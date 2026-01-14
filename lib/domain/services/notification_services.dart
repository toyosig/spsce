import 'package:circ/main.dart';
import 'package:circ/presentation/routes/notification_routing.dart';
import 'package:circ/presentation/feature/profile_screen/view_model/profile_view_model.dart';
import 'package:circ/core/constant/global.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Background message handler
Future<void> firebaseMessageBackgroundHandle(RemoteMessage message) async {
  log("BackGround Message :: ${message.messageId}");
  display(message);
}

class NotificationService {
  // Local notifications plugin instance
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  RemoteMessage? initialMessage;

  // Initialize Firebase Messaging and notifications
  initInfo() async {
    // Set options for how notifications should be displayed when the app is in the foreground.
    initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );

    // Request permission (iOS-specific).
    var request = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    await FirebaseMessaging.instance.subscribeToTopic("amoriAi");
    if (request.authorizationStatus == AuthorizationStatus.authorized ||
        request.authorizationStatus == AuthorizationStatus.provisional) {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      var iosInitializationSettings = const DarwinInitializationSettings();

      final InitializationSettings initializationSettings =
          InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: iosInitializationSettings,
          );

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          debugPrint("🧭 Local notification tapped: ${response.payload}");
          handleLocalNotificationTap(response.payload);
        },
      );
      await setupInteractedMessage();
      await getToken();
    }
  }

  // Handle notification taps
  Future<void> setupInteractedMessage() async {
    initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    debugPrint("in inital message: ");
    if (initialMessage != null) {
      debugPrint("in inital message:1 $initialMessage ");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        handleNotificationTap(initialMessage!);
      });
    }

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("onMessageOpenedApp:1 $initialMessage");
      handleNotificationTap(message);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        debugPrint("FirebaseMessagingonMessage.listen:");
        display(message); // Show local notification
        _refreshNotifications();
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("onMessageOpenedApp2:");
      handleNotificationTap(message);
    });
  }

  void handleNotificationTap(RemoteMessage message) {
    debugPrint("🧭 Tap message data: ${message.data}");
    final payload = jsonEncode(message.data);

    // Refresh notifications list when notification is tapped
    _refreshNotifications();

    Future.delayed(Duration(milliseconds: 150), () {
      if (navigatorKey.currentContext != null) {
        handleNotificationRouting(payload);
      } else {
        debugPrint("❌ Context is null, delaying navigation...");
      }
    });
  }

  // Handle local notification taps
  void handleLocalNotificationTap(String? payload) {
    debugPrint("🧭 Local notification tap with payload: $payload");
    if (payload != null) {
      _refreshNotifications();
      Future.delayed(Duration(milliseconds: 150), () {
        if (navigatorKey.currentContext != null) {
          handleNotificationRouting(payload);
        } else {
          debugPrint("❌ Context is null, delaying navigation...");
        }
      });
    }
  }

  // Get FCM token for device
  static getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token!;
  }

  // Refresh notifications list in ProfileViewModel
  void _refreshNotifications() {
    try {
      // Get ProfileViewModel instance and refresh notifications
      final profileVm = getIt.get<ProfileViewModel>();
      profileVm.getAllNotifications(isRefresh: true);
    } catch (e) {
      debugPrint("❌ Error refreshing notifications: $e");
    }
  }
}

// Display local notification
void display(RemoteMessage message) async {
  debugPrint('Got a message: ${message.notification!.title}');
  debugPrint('Message data: ${message.data}');

  try {
    // Define an Android notification channel.
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      '0',
      'Luvita Ai',
      description: 'Show Luvita Ai Notification',
      importance: Importance.max,
    );

    // Define Android-specific notification details.
    AndroidNotificationDetails notificationDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: 'your channel Description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
    );

    // Define iOS-specific notification details.
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        );

    // Combine Android and iOS details
    NotificationDetails notificationDetailsBoth = NotificationDetails(
      android: notificationDetails,
      iOS: darwinNotificationDetails,
    );

    // Create payload from message data
    final payload = jsonEncode(message.data);
    debugPrint('Displaying notification with payload: $payload');

    // Display the notification
    await FlutterLocalNotificationsPlugin().show(
      0,
      message.notification!.title,
      message.notification!.body,
      notificationDetailsBoth,
      payload: payload,
    );

    // Refresh notifications list in ProfileViewModel after displaying local notification
    _refreshNotificationsFromDisplay();
  } on Exception catch (e) {
    log("Error Local Notification: ${e.toString()}");
  }
}

// Refresh notifications list in ProfileViewModel from display function
void _refreshNotificationsFromDisplay() {
  try {
    // Get ProfileViewModel instance and refresh notifications
    final profileVm = getIt.get<ProfileViewModel>();
    profileVm.getAllNotifications(isRefresh: true);
  } catch (e) {
    debugPrint("❌ Error refreshing notifications from display: $e");
  }
}
