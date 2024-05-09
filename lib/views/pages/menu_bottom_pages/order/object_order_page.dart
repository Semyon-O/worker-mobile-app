import 'package:flutter/material.dart';
import 'package:ismpr_worker_app/models/order_model.dart';
import 'package:ismpr_worker_app/viewmodel/order_viewmodel.dart';
import 'package:provider/provider.dart';


class OrderInfoPage extends StatefulWidget {

  final Order order;

  OrderInfoPage({required this.order});

  @override
  State<OrderInfoPage> createState() => _OrderInfoPageState();
}

class _OrderInfoPageState extends State<OrderInfoPage> {

  var titleTextStyle = TextStyle(
      color: Color.fromRGBO(167, 167, 167, 1),
      fontFamily: "Roboto",
      fontWeight: FontWeight.w400,
      fontSize: 14
  );
  var infoTextStyle = TextStyle(
      color: Color.fromRGBO(236, 128, 0, 1),
      fontFamily: "Roboto",
      fontWeight: FontWeight.w400,
      fontSize: 14
  );

  @override
  Widget build(BuildContext context) {
    print(widget.order.id);
    return Scaffold(
      appBar: AppBar(title: Text("Заявка №${widget.order.id}"),),
      body: Consumer<OrderViewModel>(builder: (BuildContext context, value, Widget? child) {
          return Container(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Информация об оборудовании", style: TextStyle(
                          color: Color.fromRGBO(5, 96, 250, 1),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Наименование оборудования:", style: titleTextStyle,),
                          Text("${widget.order.clientEquipment.name}", style: infoTextStyle,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Тип оборудования", style: titleTextStyle),
                          Text("${widget.order.clientEquipment.type}", style: infoTextStyle,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Тип сервис", style: titleTextStyle),
                          Text("${widget.order.typeService.name}", style: infoTextStyle,)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Divider(),
                      ),
                      Text("Информация о клиенте", style: TextStyle(
                          color: Color.fromRGBO(5, 96, 250, 1),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Имя:", style: titleTextStyle),
                          Text("${widget.order.client.firstName}", style: infoTextStyle,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Фамилия:", style: titleTextStyle),
                          Text("${widget.order.client.lastName}", style: infoTextStyle,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Телефон:", style: titleTextStyle),
                          Text("${widget.order.client.phone}", style: infoTextStyle,)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Адрес:", style: titleTextStyle),
                          Text("${widget.order.client.address}", style: infoTextStyle,)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Divider(),
                      ),
                      Text("Информация о поломке", style: TextStyle(
                          color: Color.fromRGBO(5, 96, 250, 1),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                      ),),
                      Container(
                        child: RichText(
                          maxLines: null, text: WidgetSpan(child: Text("${widget.order.problemDescription}")),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
