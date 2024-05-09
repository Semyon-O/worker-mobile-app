import 'package:flutter/material.dart';
import 'package:ismpr_worker_app/viewmodel/order_viewmodel.dart';
import 'package:ismpr_worker_app/viewmodel/store_viewmodel.dart';
import 'package:ismpr_worker_app/viewmodel/user_viewmodel.dart';
import 'package:ismpr_worker_app/views/pages/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel()),
        ChangeNotifierProvider(create: (context) => StoreViewModel()),
        ChangeNotifierProvider(create: (context) => OrderViewModel()),
    ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
