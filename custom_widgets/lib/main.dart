import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_desktop_kit/cdk.dart';
import 'package:window_manager/window_manager.dart';
import 'layout.dart';

void main() async {
  if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    WidgetsFlutterBinding.ensureInitialized();
    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setSize(const Size(800.0, 600.0));
      await windowManager.setMinimumSize(const Size(800.0, 600.0));
      await windowManager.setTitle('Windows XP Simulation');
    });
  }

  runApp(CDKApp(
    defaultAppearance: "light",
    defaultColor: "systemBlue",
    child: Layout(),
  ));
}
