import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  String? port = dotenv.env['API_PORT'];
  Uri getDevicesURI() => Uri(
        scheme: 'http',
        host: dotenv.env['API_HOST'],
        port: port != null ? int.parse(port!) : null,
        path: dotenv.env['API_PATH'],
      );
}
