import 'package:permission_handler/permission_handler.dart';

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
