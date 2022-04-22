import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper {
  Networkhelper(this.url);
  final Uri url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String status = response.body;
      var decodedata = jsonDecode(status);
      return decodedata;
    } else {
      print(response.statusCode);
    }
  }
}
