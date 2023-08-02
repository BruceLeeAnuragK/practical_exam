import 'dart:convert';
import 'package:http/http.dart' as http;

class APIhelper {
  APIhelper._();

  static final APIhelper apihelper = APIhelper._();

  Future<Map?> getQuotesResponse() async {
    String QuotesApi = "https://dummyjson.com/quotes";
    http.Response response = await http.get(Uri.parse(QuotesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Map allData = data["quotes"];
      print("###########################");
      print(allData);
      print(allData.runtimeType);
      print("###########################");
      return allData;
    }
  }
}
