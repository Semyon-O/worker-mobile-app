import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:ismpr_worker_app/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:ismpr_worker_app/settings.dart';
import 'package:path_provider/path_provider.dart';


class UserViewModel extends ChangeNotifier {

  User? user;
  late Directory _appDocumentsDirectory;

  Future<bool> authUser(String username, String password) async {
    var authUrl = Uri.parse('${ApiSettings.url}/${ApiSettings.workerDomain}/auth/');

    try {
      var response = await http.post(
          authUrl,
          body: {
            'username': username,
            'password': password,
          }
      );

      if (response.statusCode == 200){
        print(
            response.body
        );
        Map<String, dynamic> responseBodyMap = jsonDecode(response.body);
        User user = User.fromJson(responseBodyMap);
        saveUser(user);
        return true;
      }

    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<void> saveUser (User user) async {
    _appDocumentsDirectory = await getApplicationDocumentsDirectory();
    File userFile = File('${_appDocumentsDirectory.path}/user.json');

    try {
      // Преобразуем пользователя в JSON и записываем в файл
      String userJson = jsonEncode(user.toJson());
      await userFile.writeAsString(userJson);
      print('Пользователь успешно сохранен в файл');
    } catch (e) {
      print('Ошибка при сохранении пользователя: $e');
    }
  }

  Future<bool> getUser() async {
    try {
      _appDocumentsDirectory = await getApplicationDocumentsDirectory();
      File userFile = File('${_appDocumentsDirectory.path}/user.json');

      // Если файл существует, читаем его содержимое и десериализуем JSON
      if (await userFile.exists()) {
        String userJson = await userFile.readAsString();
        Map<String, dynamic> userMap = jsonDecode(userJson);
        user = User.fromJson(userMap);
        notifyListeners();
        return true;
      } else {
        user = null;
        print('Файл пользователя не найден');
        return false;
        // return null;
      }
    } catch (e) {
      print('Ошибка при загрузке пользователя: $e');
      return false;
    }
  }
}