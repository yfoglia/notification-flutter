import 'package:flutter/material.dart'; // o cualquier otra biblioteca que necesites para la configuración de tu aplicación
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    // Solicitar permiso para recibir notificaciones
    _firebaseMessaging.requestPermission();
    
    // Configurar el manejo de las notificaciones cuando la app está en primer plano
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Notificación en primer plano: ${message.notification!.body}");
      // Aquí puedes mostrar una notificación en la interfaz de tu aplicación o realizar otras acciones.
    });

    Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
      await Firebase.initializeApp();
      print("Notificación en segundo plano: ${message.notification!.body}");
      // Aquí puedes realizar acciones según la notificación recibida en segundo plano.
    }


    // Configurar el manejo de las notificaciones cuando la app está en segundo plano
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Obtener el token de registro del dispositivo
    _firebaseMessaging.getToken().then((token) {
      print("Token de registro del dispositivo: $token");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Configuración de tu aplicación
    );
  }
}
