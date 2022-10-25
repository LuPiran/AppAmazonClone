import 'package:amazon_app/layout/screen_layout.dart';
import 'package:amazon_app/screens/sign_in_screen.dart';
import 'package:amazon_app/utils/color_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyDl7q4SKsMy6UxZK7sG6KTVRNhlJvgs3Kc",
      authDomain: "app-dc78d.firebaseapp.com",
      projectId: "app-dc78d",
      storageBucket: "app-dc78d.appspot.com",
      messagingSenderId: "1024076065887",
      appId: "1:1024076065887:web:fb47f2c5eb69b6555b7fea",
      measurementId: "G-LWEG6N8RR5",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const AmazonApp());
}

class AmazonApp extends StatelessWidget {
  const AmazonApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> user) {
          if (user.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          } else if (user.hasData) {
            return const ScreenLayout();
          } else {
            return const SignInScreen();
          }
        },
      ),
    );
  }
}
