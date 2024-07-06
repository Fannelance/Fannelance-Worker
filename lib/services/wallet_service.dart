import 'package:fannelance_worker/helpers/api_request.dart';

class WalletService {
  Future<dynamic> getWalletRequest() async {
    try {
      Map<String, dynamic> data = await ApiRequest().get(url: 'worker/wallet');
      print(data);
      return data;
    } catch (e) {
      print("Error reading/parsing JSON response from server: $e");
      rethrow;
    }
  }

  Future<dynamic> topUpWalletRequest(int amount) async {
    try {
      Map<String, dynamic> data = await ApiRequest().put(
        url: 'worker/deposite',
        data: {'amount': amount},
      );
      print(data);
      return data;
    } catch (e) {
      print("Error reading/parsing JSON response from server: $e");
      rethrow;
    }
  }
}
