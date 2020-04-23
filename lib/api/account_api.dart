import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountAPI {
  Future<bool> login(String email, String password) async {
    try {
      final http.Response response = await http.post(
          "https://reqres.in/api/login",
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({"email": email, "password": password, "age": 292}));
      print(response.body);
      if (response.statusCode == 200) {
        final dynamic parsed = jsonDecode(response.body);
        print("Login Ok${parsed['token']}");
        return true;
      } else {
        print("response.statusCode ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("error <Login>: $e");
      return false;
    }
  }

//get user
  Future<List<dynamic>> getUsers(int page) async {
    final url = 'https://reqres.in/api';
    try {
      final http.Response response = await http.get("$url/users?page=$page&delay=3");
      print(response.body);
      if (response.statusCode == 200) {
        final parse = jsonDecode(response.body);
        print("getUsed ok");
        print(parse['data'].runtimeType);
        return parse['data'];
      }

      print("response.statusCode ${response.statusCode}");
      return [];
    } catch (e) {
      print("error <getUsers>: $e");
      return [];
    }
  }
}
