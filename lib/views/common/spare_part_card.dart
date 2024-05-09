import 'package:flutter/material.dart';


class SparePartCard extends StatelessWidget {
  const SparePartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Наименование:"),
              ],
            ),
            Row(
              children: [
                Text("Производитель"),
              ],
            ),

            Row(
              children: [
                Text("Описание:"),
              ],
            ),

            Row(
              children: [
                Text("Количество"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


