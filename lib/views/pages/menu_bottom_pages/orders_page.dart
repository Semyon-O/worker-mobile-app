import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ismpr_worker_app/main.dart';
import 'package:ismpr_worker_app/models/order_model.dart';
import 'package:ismpr_worker_app/viewmodel/order_viewmodel.dart';
import 'package:ismpr_worker_app/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../models/user_model.dart';
import 'order/list_order_page.dart';


class MainMenuActions extends StatefulWidget {

  MainMenuActions({super.key});

  @override
  State<MainMenuActions> createState() => _MainMenuActionsState();
}

class _MainMenuActionsState extends State<MainMenuActions> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = Provider.of<UserViewModel>(context, listen: false);
    OrderViewModel orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
    orderViewModel.fetchCurrentActiveOrder(userViewModel.user!.token);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Consumer<UserViewModel>(
          builder: (BuildContext context, UserViewModel value, Widget? child) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(5, 96, 250, 1),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      height: 100,
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          CircleAvatar(backgroundColor: Colors.amber,),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Здравствуйте, ${value.user?.firstName}"),
                                Text("На сегодня столько заявок на услуги")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 44,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(207, 207, 207, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Consumer<OrderViewModel>(
                              builder: (BuildContext context, OrderViewModel value, Widget? child) {
                                final activeOrderId = value.activeOrder?.id;
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    activeOrderId != null ? "Текущая заявка: $activeOrderId" : "Нет активных заявок",
                                  ),
                                );
                              }
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: () {
                              UserViewModel userViewModel = Provider.of<UserViewModel>(context, listen: false);
                              OrderViewModel orderViewModel = Provider.of<OrderViewModel>(context, listen: false);
                              orderViewModel.fetchCurrentActiveOrder(userViewModel.user!.token);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 44,),

                    Container(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Container(
                                    height: 160,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color.fromRGBO(242, 242, 242, 1)
                                    ),
                                    child: Text("История заявок"),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Container(
                                    height: 160,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color.fromRGBO(242, 242, 242, 1)
                                    ),
                                    child: Text("Отзывы"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12,),
                          Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 12),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ListPlannedOrderPage(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 160,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Color.fromRGBO(242, 242, 242, 1)
                                        ),
                                        child: Text("Запланированный список заявок клиентов"),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => TodayListOrderPage(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 160,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: Color.fromRGBO(242, 242, 242, 1)
                                        ),
                                        child: Text("Список заявок клиентов на сегодня"),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
