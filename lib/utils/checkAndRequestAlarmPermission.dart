import 'package:permission_handler/permission_handler.dart';
import 'package:restaurant_app/utils/logger.dart';

Future checkAndRequestAlarmPermission() async {
  const String permissionName = 'SCHEDULE_EXACT_ALARM';

  if (await Permission.scheduleExactAlarm.isDenied) {
    logger.d('Meminta izin $permissionName');

    final status = await Permission.scheduleExactAlarm.request();

    if (status.isGranted) {
      logger.d('Izin $permissionName diberikan');
    } else {
      logger.d('Izin $permissionName ditolak');
    }
  } else if (await Permission.scheduleExactAlarm.isGranted) {
    logger.d('Izin untuk $permissionName sudah diberikan');
  } else if (await Permission.scheduleExactAlarm.isPermanentlyDenied) {
    logger.d(
      'Izin untuk $permissionName ditolak secara permanen. Silahkan buka pengaturan untuk mengaktifkan izin secara menual',
    );
    await openAppSettings();
  }
}
