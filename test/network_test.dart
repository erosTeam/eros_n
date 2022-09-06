import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('NH', () async {
    var headers = {
      'cookie':
          'cf_clearance=6dsrFOlTMeE8iDVcta_FDAUPs466BtRi2VTLoy4Wuz0-1662493545-0-150; csrftoken=tPal8XhvGycU22LwiOhLZ4KRqBndr519zLORNMpOTJpw8pEBbw7TEdkXZipHYDXZ',
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27'
    };
    var request = http.Request('GET', Uri.parse('https://nhentai.net/'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  });
}
