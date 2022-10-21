import 'package:caregigsworkabroad/services/localstorage.dart';
import 'package:get/get.dart';
import '../services/notification_services.dart';

class GlobalService extends GetxService {
  LocalStorage localStorage = LocalStorage();
  static GlobalService get to => Get.find<GlobalService>();
  String? userId;
  String? userAccessToken;
  String? userRefreshToken;

  saveUserData(giveUserId, giveAccessToken, giveRefreshToken) {
    userId = giveUserId;
    userAccessToken = giveAccessToken;
    userRefreshToken = giveRefreshToken;
  }

  String getUserId() => userId!;
  String getAccessToken() => userAccessToken!;
  String getRefreshToken() => userRefreshToken!;

  getUserDataOnInit() async {
    userId = await localStorage.readSecureData('userId');
    userAccessToken = await localStorage.readSecureData('accessToken');
    userRefreshToken = await localStorage.readSecureData('refreshToken');
  }

  // @override
  // void onInit() {
  //   getUserDataOnInit();
  //   super.onInit();
  // }

  String initialRoute() {
    if (userAccessToken != null) {
      return 'login';
    } else {
      return 'HomePage';
    }
  }

  RxString notificationTitle = 'No Title'.obs;
  RxString notificationBody = 'No Body'.obs;
  RxString notificationData = 'No Data'.obs;

  _changeData(String msg) {
    print(msg);
    return notificationData(msg);
  }

  _changeBody(String msg) {
    print(msg);
    return notificationBody(msg);
  }

  _changeTitle(String msg) => notificationTitle(msg);

  @override
  void onInit() {
    final firebaseMessaging = FCM();
    firebaseMessaging.setNotifications();

    firebaseMessaging.streamCtlr.stream.listen(_changeData);
    firebaseMessaging.bodyCtlr.stream.listen(_changeBody);
    firebaseMessaging.titleCtlr.stream.listen(_changeTitle);
    super.onInit();
  }
}
