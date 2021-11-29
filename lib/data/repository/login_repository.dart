import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iguard/data/model/api_result_model.dart';

abstract class LoginRepository {
  Future<Details> getLogin(String username, String password);
}
 class LoginRepositoryImpl implements LoginRepository{
  @override
  Future<Details> getLogin(String username,String password) async {
    final response = await http.post(
      Uri.parse('http://iguard.concetto-project-progress.com/api/v2/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, dynamic>{
        "device_id": "fugvk9qw2vk:apa91bg5duiltd0e-nt5yqknuocuymtqdkgugv5ylx74-arlhpliekbm-zfio3l7ntbihtttvitm5dc6hc2bwgea-tylqamvjw4jthubyl9jikphfskcsgrlr6266voo1hexcq6y821m",
        "device_type": "1",
        "latitude": 0.0,
        "longitude": 0.0,
        'username': username,
        'password': password,
      }
      ),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return Details.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception('Failed to create Login');
    }
  }
}


