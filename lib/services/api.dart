class API {
  static String host = "upmob.eastus.cloudapp.azure.com";
  Uri getDevicesURI() => Uri(scheme: 'http', host: host, port: 8081, path: '/devices/top100');
}
