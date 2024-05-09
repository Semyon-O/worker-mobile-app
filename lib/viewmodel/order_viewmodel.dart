import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ismpr_worker_app/models/order_model.dart';
import 'package:flutter/foundation.dart';
import 'package:ismpr_worker_app/settings.dart';


class OrderViewModel extends ChangeNotifier {

  List<Order> _orders = [];
  List<Order> _todayOrders = [];
  Order? _activeOrder;

  List<Order> get orders => _orders;
  List<Order> get todayOrders => _todayOrders;
  Order? get activeOrder => _activeOrder;

  bool _isLoadingData = false;
  bool get isLoadingData => _isLoadingData;


  Future<void> fetchPlannedOrders(String token) async {
    _isLoadingData = true;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('${ApiSettings.url}/${ApiSettings.orderDomain}/'),
        headers: {
          "Authorization": token,
        }
      );

      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        List<dynamic> responseData = json.decode(responseBody);
        _orders = responseData.map((json) => Order.fromJson(json)).toList();
      } else {
        print('Ошибка: ${response.statusCode}');
      }
    } catch (e) {
      print("[STORE ERROR]: ${e}");
    }

    _isLoadingData = false;
    notifyListeners();
  }

  Future<void> fetchTodayOrders(String token) async {
    _isLoadingData = true;
    notifyListeners();

    try {
      final response = await http.get(
          Uri.parse('${ApiSettings.url}/${ApiSettings.orderDomain}/today/'),
          headers: {
            "Authorization": token,
          }
      );

      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        List<dynamic> responseData = json.decode(responseBody);
        _todayOrders = responseData.map((json) => Order.fromJson(json)).toList();
      } else {
        print('Ошибка: ${response.statusCode}');
      }
    } catch (e) {
      print("[STORE ERROR]: ${e}");
    }

    _isLoadingData = false;
    notifyListeners();
  }

  Future<void> fetchCurrentActiveOrder(String token) async {
    try {
      final response = await http.get(
          Uri.parse('${ApiSettings.url}/${ApiSettings.orderDomain}/active/'),
          headers: {
            "Authorization": token,
          }
      );

      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        List<dynamic> responseData = json.decode(responseBody);
        var todayOrders = responseData.map((json) => Order.fromJson(json)).toList();
        _activeOrder = todayOrders[0];
      } else {
        print('Ошибка: ${response.statusCode}');
      }
    } catch (e) {
      print("[ACTIVE ORDER ERROR]: ${e}");
      _activeOrder = null;
    }
  }

  Future<void> fetchHistoryOrders(String token) async {
    _isLoadingData = true;
    notifyListeners();

    try {
      final response = await http.get(
          Uri.parse('${ApiSettings.url}/${ApiSettings.orderDomain}/history/'),
          headers: {
            "Authorization": token,
          }
      );

      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        List<dynamic> responseData = json.decode(responseBody);
        _todayOrders = responseData.map((json) => Order.fromJson(json)).toList();
      } else {
        print('Ошибка: ${response.statusCode}');
      }
    } catch (e) {
      print("[STORE ERROR]: ${e}");
    }

    _isLoadingData = false;
    notifyListeners();
  }
}