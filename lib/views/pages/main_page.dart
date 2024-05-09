import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ismpr_worker_app/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user_model.dart';
import 'auth/login.dart';
import 'menu_bottom_pages/orders_page.dart';
import 'menu_bottom_pages/store_page.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(
        builder: (context, model, child) {
          Provider.of<UserViewModel>(context, listen: false).getUser();
          if (model.user != null) {
            return AuthStartPage();
          } else {
            return LogInPage();
          }
        }
    );
  }
}


class AuthStartPage extends StatefulWidget {
  const AuthStartPage({super.key});

  @override
  State<AuthStartPage> createState() => _AuthStartPageState();
}

class _AuthStartPageState extends State<AuthStartPage> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    MainMenuActions(),
    ListStore(),
    Text(
      'Профиль аккаунта',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            label: 'Заявки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Склады',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
