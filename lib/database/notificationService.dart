// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   static final FirebaseMessaging _firebaseMessaging =
//       FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin
//       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   static Future<void> initialize() async {
//     // Konfigurasi notifikasi lokal
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);
//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

//     // Meminta izin notifikasi dari pengguna
//     await _firebaseMessaging.requestPermission();
//     await _firebaseMessaging.setForegroundNotificationPresentationOptions(
//         alert: true, badge: true, sound: true);
//   }

//   static Future<void> scheduleNotification(String title, String body) async {
//     // Konfigurasi notifikasi lokal
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     // Mendapatkan waktu saat ini
//     final DateTime now = DateTime.now();

//     // Membuat objek DateTime untuk waktu notifikasi
//     final DateTime scheduledTime = DateTime(
//       now.year,
//       now.month,
//       now.day,
//       now.hour,
//       now.minute + 1,
//       0,
//     );

//     // Mengatur notifikasi dengan menggunakan waktu notifikasi yang sudah ditentukan
//     await _flutterLocalNotificationsPlugin.schedule(
//       0, // ID unik notifikasi
//       title, // Judul notifikasi
//       body, // Isi notifikasi
//       scheduledTime,
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//     );
//   }

//   static void configureFirebaseMessaging() {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       final notification = message.notification;
//       final title = notification?.title ?? '';
//       final body = notification?.body ?? '';

//       // Menampilkan notifikasi ketika aplikasi sedang berjalan
//       await _flutterLocalNotificationsPlugin.show(
//         0, // ID unik notifikasi
//         title, // Judul notifikasi
//         body, // Isi notifikasi
//         platformChannelSpecifics,
//       );
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       // Menangani notifikasi saat aplikasi diluncurkan atau di-resume
//       // ...
//     });
//   }
// }
