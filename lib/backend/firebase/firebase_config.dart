import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA7aZLhgsYBTd08PAQH-SltJlCC0u2e818",
            authDomain: "like-mind-2iwscr.firebaseapp.com",
            projectId: "like-mind-2iwscr",
            storageBucket: "like-mind-2iwscr.firebasestorage.app",
            messagingSenderId: "526587493281",
            appId: "1:526587493281:web:9182940a0b599622c769e0",
            measurementId: "G-CE5YCGSCGY"));
  } else {
    await Firebase.initializeApp();
  }
}
