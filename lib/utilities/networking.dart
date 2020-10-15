import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  String url;

  Future<dynamic> GET() async {
    // Function to place get request and get body and status code
    http.Response response = await http.get(url);
    Map resp;
    var body = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      resp['body'] = body;
      resp['status_code'] = response.statusCode;
    } else {
      resp['error'] = body;
      resp['status_code'] = response.statusCode;
      resp['message'] = "There is some error";
    }
    return resp;
  }
}