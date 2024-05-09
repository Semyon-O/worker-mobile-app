import 'package:flutter/material.dart';
import 'package:ismpr_worker_app/viewmodel/order_viewmodel.dart';
import 'package:ismpr_worker_app/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:ismpr_worker_app/views/common/order_card_widget.dart';

class ListPlannedOrderPage extends StatefulWidget {
  const ListPlannedOrderPage ({super.key});

  @override
  State<ListPlannedOrderPage> createState() => ListOrderPage_State();
}

class ListOrderPage_State extends State<ListPlannedOrderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              var model = Provider.of<UserViewModel>(context, listen: false);
              Provider.of<OrderViewModel>(context, listen: false).fetchPlannedOrders(model.user!.token);
            },
          ),
        ],
      ),
      body: Consumer<OrderViewModel>(
        builder: (BuildContext context, OrderViewModel value, Widget? child) {
          if (value.isLoadingData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            padding: EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: value.orders.length,
                itemBuilder: (context, index) {
                  return OrderCard(
                    titleOrder: value.orders[index].id.toString(),
                    datePlaned: value.orders[index].dateOrder,
                    typeService: value.orders[index].typeService.name,
                    typeEquip: value.orders[index].clientEquipment.name,
                    order: value.orders[index],
                  );
                }
            ),
          );
        },
      )
    );
  }
}

class TodayListOrderPage extends StatefulWidget {
  const TodayListOrderPage({super.key});

  @override
  State<TodayListOrderPage> createState() => _TodayListOrderPageState();
}

class _TodayListOrderPageState extends State<TodayListOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                var model = Provider.of<UserViewModel>(context, listen: false);
                Provider.of<OrderViewModel>(context, listen: false).fetchTodayOrders(model.user!.token);
              },
            ),
          ],
        ),
        body: Consumer<OrderViewModel>(
          builder: (BuildContext context, OrderViewModel value, Widget? child) {
            if (value.isLoadingData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              padding: EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: value.todayOrders.length,
                  itemBuilder: (context, index) {
                    return OrderCard(
                      titleOrder: value.todayOrders[index].id.toString(),
                      datePlaned: value.todayOrders[index].dateOrder,
                      typeService: value.todayOrders[index].typeService.name,
                      typeEquip: value.todayOrders[index].clientEquipment.name,
                      order: value.todayOrders[index],
                    );
                  }
              ),
            );
          },
        )
    );
  }
}
