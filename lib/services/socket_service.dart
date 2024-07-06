import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/widgets/home_button_widget.dart';
import 'package:fannelance_worker/widgets/notification_details_widget.dart';
import 'package:fannelance_worker/widgets/notification_showmodal.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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
    socket!.emit('connected-worker', [token, available]);
  }

  Future<void> listenToRequests() async {
    String? token = await kSecureStorage.read(key: 'token');
    String workerId = JwtDecoder.decode(token!)['_id'];
    socket!.on('request-$workerId', (data) {
      NotificationShowModal.showModalSheet(
        ButtonHomeWidgetState.homeContext!,
        NotificationDetailsWidget(
          userData: data['user'],
          request: data['request'],
        ),
      );
    });
  }

  Future<void> acceptRequest(request) async {
    socket!.emit('accept-request', request);
  }

  void disconnect() {
    if (socket != null) {
      socket!.disconnect();
    }
  }
}
