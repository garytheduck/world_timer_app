import 'dart:convert';

import 'package:http/http.dart' as http;

/// weather API network helper
/// pass the weatherAPI url
///  to this class to get geographical coordinates

class NetworkData{
  NetworkData(this.url);
  final String url;

  /// get geographical coordinates from open weather API call
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}