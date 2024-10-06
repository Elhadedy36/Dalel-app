import 'package:dalel/app/dalel_app.dart';
import 'package:dalel/core/Services/Service_Locator.dart';
import 'package:dalel/core/database/Cache/Cache_Helper.dart';
import 'package:dalel/core/functions/get_state_changes.dart';

import 'package:dalel/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GetStateChanges();

  runApp(const Dalel());
}
