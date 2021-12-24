import 'package:flutter_dotenv/flutter_dotenv.dart';

class API {
  String? port = dotenv.env['PORT'];
  Uri getDevicesURI() => Uri(scheme: 'http', host: dotenv.env['HOST'], port: port != null ? int.parse(port!) : null, path: dotenv.env['PATH']);
}
