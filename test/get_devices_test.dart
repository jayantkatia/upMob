import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'package:upcoming_mobiles_frontend/model/device.dart';
import 'package:upcoming_mobiles_frontend/services/api_services.dart';
import 'get_devices_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  group("getDevices", () {
    test('WHEN http call completes successfully THEN returns a List of Devices', () async {
      final client = MockClient();
      final APIService apiService = APIService.init();

      when(client.get(apiService.api.getDevicesURI())).thenAnswer((_) async => http.Response(
          '[{'
          '"device_name": "abc",'
          '"expected": "Expected Launch:April 20xx",'
          '"img_url": "https://picsum.photos/100",'
          '"source_url": "https://picsum.photos",'
          '"price": 9999,'
          '"spec_score": 89,'
          '"last_updated": "09-072021",'
          '"scrape_timestamp":"20391239"'
          '}]',
          200));

      expect(await apiService.getDevices(client), isA<List<Device>>());
    });
    test('WHEN http call completes with an error AND returns "" THEN throws exception', () {
      final client = MockClient();
      final APIService apiService = APIService.init();

      when(client.get(apiService.api.getDevicesURI())).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(apiService.getDevices(client), throwsException);
    });
    test('WHEN http call completes successfully AND returns [] THEN throws exception', () {
      final client = MockClient();
      final APIService apiService = APIService.init();

      when(client.get(apiService.api.getDevicesURI())).thenAnswer((_) async => http.Response('[]', 200));

      expect(apiService.getDevices(client), throwsA(isException));
    });

    test('WHEN http call completes successfully AND returns "" THEN throws exception', () {
      final client = MockClient();
      final APIService apiService = APIService.init();

      when(client.get(apiService.api.getDevicesURI())).thenAnswer((_) async => http.Response('', 200));

      expect(apiService.getDevices(client), throwsException);
    });
  });
}
