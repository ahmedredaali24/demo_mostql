import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD7Jv5ZmiKDm4JADyFvHg5SAKWzAVQa_Wk",
            authDomain: "plateau-ipx6hs.firebaseapp.com",
            projectId: "plateau-ipx6hs",
            storageBucket: "plateau-ipx6hs.firebasestorage.app",
            messagingSenderId: "103315075742",
            appId: "1:103315075742:web:1e187336cc3bf92444018f"));
  } else {
    await Firebase.initializeApp();
  }
}
