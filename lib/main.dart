import 'package:airbnb/providers/experience_provider.dart';
import 'package:airbnb/providers/homes_provider.dart';
import 'package:airbnb/providers/service_provider.dart';
import 'package:airbnb/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _requestPermissions();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => HomesProvider()),
      ChangeNotifierProvider(create: (context) => ExperiencesProvider()),
      ChangeNotifierProvider(create: (context) => ServicesProvider()),
    ],
        child : const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airbnb',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const CustomBottomNavBar(),
    );
  }
}

Future<void> _requestPermissions() async {
  final statuses = await [
    Permission.notification,
    Permission.photos,
    Permission.videos,
    Permission.audio,
  ].request();


  if (statuses[Permission.notification]?.isDenied ?? false) {

  }
  if (statuses[Permission.photos]?.isDenied == true ||
      statuses[Permission.videos]?.isDenied == true ||
      statuses[Permission.audio]?.isDenied == true) {
    openAppSettings();
  }
}
