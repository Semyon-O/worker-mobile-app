import 'package:flutter/material.dart';
import 'package:ismpr_worker_app/views/pages/menu_bottom_pages/store_items/object_store_page.dart';


class StoreCard extends StatelessWidget {

  final int? id;
  final String? address;
  final String? phone;
  final String? time;
  final List<double>? coords;
  final int indexStore;

  StoreCard({
    Key? key,
    required this.id,
    required this.address,
    required this.phone,
    required this.time,
    required this.coords,
    required this.indexStore
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StoreObjectPage(indexStore: this.indexStore,),
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
                  Text("Адрес расположения склада:"),
                  Expanded(child: Text(address!, textAlign: TextAlign.end,),),
                ],
              ),
              Row(
                children: [
                  Text("Контактный телефон:"),
                  Expanded(child: Text(phone!, textAlign: TextAlign.end)),
                ],
              ),
              Row(
                children: [
                  Text("Время работы:"),
                  Expanded(child: Text(time!, textAlign: TextAlign.end)),
                ],
              ),
              Row(
                children: [
                  Text("Координаты"),
                  Expanded(child: Text(coords.toString(), textAlign: TextAlign.end)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
