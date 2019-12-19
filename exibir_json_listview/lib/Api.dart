import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com/users";

class API {
  static Future getUsers() async {

    return await http.get(baseUrl);
  }
}