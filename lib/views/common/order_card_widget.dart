import 'package:flutter/material.dart';
import 'package:ismpr_worker_app/models/order_model.dart';
import 'package:ismpr_worker_app/views/pages/menu_bottom_pages/order/object_order_page.dart';


class OrderCard extends StatelessWidget {

  final String? titleOrder;
  final String? datePlaned;
  final String? typeService;
  final String? typeEquip;
  final Order order;

  OrderCard({
    Key? key,
    required this.titleOrder,
    required this.datePlaned,
    required this.typeService,
    required this.typeEquip,
    required this.order
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OrderInfoPage(order: this.order,),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Наименование:"),
                  Expanded(child: Text(titleOrder!, textAlign: TextAlign.end,),),
                ],
              ),
              Row(
                children: [
                  Text("Дата исполнения:"),
                  Expanded(child: Text(datePlaned!, textAlign: TextAlign.end)),
                ],
              ),
              Row(
                children: [
                  Text("Тип услуги:"),
                  Expanded(child: Text(typeService!, textAlign: TextAlign.end)),
                ],
              ),
              Row(
                children: [
                  Text("Тип оборудования:"),
                  Expanded(child: Text(typeEquip!, textAlign: TextAlign.end)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
