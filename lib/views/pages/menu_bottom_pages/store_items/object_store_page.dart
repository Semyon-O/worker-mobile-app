import 'package:flutter/material.dart';
import 'package:ismpr_worker_app/viewmodel/store_viewmodel.dart';
import 'package:ismpr_worker_app/views/common/spare_part_card.dart';
import 'package:provider/provider.dart';


class StoreObjectPage extends StatefulWidget {

  final int indexStore;

  const StoreObjectPage({required this.indexStore});

  @override
  State<StoreObjectPage> createState() => _StoreObjectPageState();
}

class _StoreObjectPageState extends State<StoreObjectPage> {
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

  var testStores = [
    {"Наименование", '1', "desc", "amount"},
    {"Наименование", '1', "desc", "amount"},
    {"Наименование", '1', "desc", "amount"},
    {"Наименование", '1', "desc", "amount"},
    {"Наименование", '1', "desc", "amount"},
    {"Наименование", '1', "desc", "amount"},
    {"Наименование", '1', "desc", "amount"},
    {"Наименование", '1', "desc", "amount"},
    {"Наименование", '1', "desc", "amount"},
    {"Наименование", '1', "desc", "amount"},
    {"Наименование", '1', "desc", "amount"},
    {"Наименование", '1', "desc", "amount"},
    {"Наименование", '1', "desc", "amount"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<StoreViewModel>(
        builder: (BuildContext context, value, Widget? child) {
          return Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Информация о складе",
                  style: TextStyle(
                      color: Color.fromRGBO(5, 96, 250, 1),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Адрес склада:", style: titleTextStyle),
                    Expanded(child: Text("${value.stores[widget.indexStore].address}",
                      style: infoTextStyle, maxLines: null, softWrap:true,
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Телефон:", style: titleTextStyle),
                    Text("${value.stores[widget.indexStore].phone}", style: infoTextStyle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Время работы:", style: titleTextStyle),
                    Text("${value.stores[widget.indexStore].time}", style: infoTextStyle),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Divider(),
                ),
                Text(
                  "Список доступных запчастей:",
                  style: TextStyle(
                      color: Color.fromRGBO(5, 96, 250, 1),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),
                ),
                Expanded(
                  child:ListView.builder(
                    itemCount: testStores.length,
                    itemBuilder: (context, index) {
                      return SparePartCard();
                    }
                  )
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
