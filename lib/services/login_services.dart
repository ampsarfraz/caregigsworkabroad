import 'package:dio/dio.dart';
import 'package:caregigsworkabroad/utils/global_service.dart';
import 'package:caregigsworkabroad/utils/common_imports.dart';

class LoginService extends GetxController {
  final globalService = Get.find<GlobalService>();
  var dio = Dio();

  Future loginService(String argument1, String argument2) async {
    try {
      final r = await dio.post(
        '${AppConstants.apiEndpoint}/api',
        data: {"example1": argument1, "example2": argument2},
      );
      debugPrint(r.data);
      debugPrint(r.statusCode.toString());
      if (r.statusCode == 200) {
        debugPrint('success');
      } else {
        debugPrint(r.statusMessage);
      }
    } catch (err) {
      return err;
    }
  }
}
