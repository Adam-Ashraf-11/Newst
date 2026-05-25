import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newst_app/core/data_source/services/api_config.dart';

class ApiServices {
  Map<String, dynamic>? parames;

  Future<dynamic> get({
    required String endPoints,
    Map<String, dynamic>? parames,
  }) async {
    var url = Uri.http(ApiConfig.baseUrl, 'v2/$endPoints', {
      'apikey': ApiConfig.apikey,
      ...?parames,
    });

 try {
      final http.Response response = await http.get(url);

    return jsonDecode(response.body) as Map<String, dynamic>;
 } catch (e) {
   throw Exception(' Oops \' please try again');
 }
  }
}
