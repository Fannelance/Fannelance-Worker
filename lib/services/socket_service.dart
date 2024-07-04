import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/widgets/home_button_widget.dart';
import 'package:fannelance_worker/widgets/notification_details_widget.dart';
import 'package:fannelance_worker/widgets/notification_showmodal.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
class SocketService {
  io.Socket? socket;
  List<dynamic> availableWorkers = [];

  Future<void> connect() async {
    await dotenv.load(fileName: '.env');
    final String? serverURL = dotenv.env['serverURL'];

    socket = io.io(serverURL, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket!.connect();

    socket!.onConnect((_) {
      print('Connected to WebSocket Server');
    });

    socket!.onDisconnect((_) {
      print('Disconnected from WebSocket Server');
    });
  }

  Future<void> connected(bool available) async {
    print('Your are a $available');
    String? token = await kSecureStorage.read(key: 'token');
    // String workerId = JwtDecoder.decode(token!)['_id'];

    socket!.emit('connected-worker', [token, available]);
  }

  Future<void> listenToRequests() async {
    socket!.on('request', (data) {
      print('Request received');
      print(data);
      NotificationShowModal.showModalSheet(
        ButtonHomeWidgetState.homeContext!,
         NotificationDetailsWidget(userData: data),
      );
    });
  }

  void disconnect() {
    if (socket != null) {
      socket!.disconnect();
    }
  }
}
