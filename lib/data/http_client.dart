import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});
}

class HttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future get({required String url}) async {
    await client.get(Uri.parse(url));
  }

  Future post({required String url, required Map<String, dynamic> body}) async {
    await client.post(Uri.parse(url), body: body);
  }
}
