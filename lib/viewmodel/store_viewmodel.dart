import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ismpr_worker_app/models/store_model.dart';
import 'package:flutter/foundation.dart';
import 'package:ismpr_worker_app/settings.dart';


class StoreViewModel extends ChangeNotifier{

  List<Store> _stores = [];
  List<Store> get stores => _stores;
  bool _isLoadingData = false;
  bool get isLoadingData => _isLoadingData;

  Future<void> fetchAllStores() async {
    _isLoadingData = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('${ApiSettings.url}/${ApiSettings.storeDomain}/'));
      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        List<dynamic> responseData = json.decode(responseBody);
        _stores = responseData.map((json) => Store.fromJson(json)).toList();
      } else {
        print('Ошибка: ${response.statusCode}');
      }
    } catch (e) {
      // Обработка исключений, возникших при выполнении запроса
      print('Ошибка при выполнении запроса: $e');
    }
    _isLoadingData = false;
    notifyListeners();
  }
}