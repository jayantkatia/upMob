import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  Uri getDevicesURI() => Uri(
        scheme: 'http',
        host: dotenv.env['API_HOST'],
        port: int.tryParse(dotenv.env['API_PORT']!),
        path: dotenv.env['API_PATH'],
      );
}
