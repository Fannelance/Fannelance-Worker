
import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/helpers/api_request.dart';

// phoneIsNotVerified
class SendOtpService {
  Future<dynamic> sendOtpRequest() async {
    await ApiRequest().post(
      url: 'worker/send-otp',
      token: await kSecureStorage.read(key: 'token'),
    );
  }
}
