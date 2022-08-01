import 'package:http/http.dart';

class HttpServices {
  static void validRequest(Response res) {
    if (res.statusCode != 200) {
      throw Error();
    }
  }

  static bool validatePostResponse(String res) {
    if (res != 'error') {
      return true;
    }
    return false;
  }
}
