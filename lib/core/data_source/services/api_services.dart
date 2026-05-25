import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {


Future<dynamic> get(String endPoints) async{

    var url = Uri.parse('https://newsapi.org/v2/$endPoints');

    final http.Response response = await http.get(url);

    
    return jsonDecode(response.body) as Map<String, dynamic>;


}







}