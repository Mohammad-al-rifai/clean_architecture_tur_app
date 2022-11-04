import 'package:advanced_course/app/app.dart';
import 'package:flutter/material.dart';

import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
