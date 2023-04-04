import 'package:http/http.dart' as http;
import 'dart:convert';
const apikey = 'ce38019494c6c346d5f2bc8c7321047b';

class Network{
  final String url;
  Network(this.url);

  Future<dynamic> getJsonData()async{
      http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather'
          '?lat=35.1796&lon=129.0756&appid=$apikey&units=metric'));
    if(response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}