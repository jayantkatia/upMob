class API {
  static String host = "40.76.94.137";
  Uri getDevicesURI() =>
      Uri(scheme: 'http', host: host, port: 8082, path: '/devices');
}
