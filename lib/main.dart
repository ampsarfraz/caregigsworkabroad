import 'package:caregigsworkabroad/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:caregigsworkabroad/initial_bindings.dart';
import 'package:caregigsworkabroad/utils/global_service.dart';
import 'package:caregigsworkabroad/utils/constants.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic('app');
  GoogleFonts.getFont(
    'Baloo 2',
  );
  Get.put(GlobalService(), permanent: true);
  await GlobalService.to.getUserDataOnInit();
  // requirePermission();

  runApp(const WorkAbroadApp());
}

// requirePermission() async {
//   Map<Permission, PermissionStatus> statuses = await [
//     Permission.location,
//     Permission.camera,
//     //add more permission to request here.
//   ].request();
// }

class WorkAbroadApp extends StatelessWidget {
  const WorkAbroadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppTheme.appName,
          theme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: AppTheme.primaryColor,
              primarySwatch:
                  MaterialColor(AppTheme.primaryColorCode, appPrimaryColor)),
          initialBinding: InitialBindings(),
          initialRoute: GlobalService.to.initialRoute(),
          // home: const ,
          getPages: AppPages.pages,
        );
      },
    );
  }
}

Future init() async {}
