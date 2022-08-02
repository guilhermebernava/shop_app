import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:shop_app/api/api_interceptor.dart';

class Api {
  static final baseUrl = dotenv.env['ApiUrl'] ??
      'https://shop-app-5e60e-default-rtdb.firebaseio.com/';

  Client client = InterceptedClient.build(
    interceptors: [ApiInterceptor()],
    requestTimeout: const Duration(seconds: 5),
  );

  Future<Response?> get(String endpoint) async {
    try {
      return await client.get(Uri.parse(baseUrl + endpoint));
    } catch (e) {
      return null;
    }
  }

  Future<Response?> post(String endpoint, String body) async {
    try {
      return await client.post(
        Uri.parse(baseUrl + endpoint),
        body: body,
        headers: <String, String>{
          'Content-type': 'application/json',
        },
      );
    } catch (e) {
      return null;
    }
  }

  Future<Response?> put(String endpoint, String body) async {
    try {
      return await client.put(
        Uri.parse(baseUrl + endpoint),
        body: body,
        headers: <String, String>{
          'Content-type': 'application/json',
        },
      );
    } catch (e) {
      return null;
    }
  }

  Future<Response?> delete(String endpoint, String body) async {
    try {
      return await client.delete(
        Uri.parse(baseUrl + endpoint),
        body: body,
        headers: <String, String>{
          'Content-type': 'application/json',
        },
      );
    } catch (e) {
      return null;
    }
  }
}
