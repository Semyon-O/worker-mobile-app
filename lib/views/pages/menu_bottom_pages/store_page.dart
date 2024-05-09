import 'package:flutter/material.dart';
import 'package:ismpr_worker_app/viewmodel/store_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../common/store_info_card_widget.dart';


class ListStore extends StatefulWidget {
  const ListStore({super.key});

  @override
  State<ListStore> createState() => _ListStoreState();
}

class _ListStoreState extends State<ListStore> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Provider.of<StoreViewModel>(context, listen: false).fetchAllStores();
            },
          ),
        ],
      ),
      body: Consumer<StoreViewModel>(
        builder: (context, model, child) {
          if (model.isLoadingData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
              padding: EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: model.stores.length,
                  itemBuilder: (context, index) {
                    return StoreCard(
                      id: model.stores[index].id as int?,
                      address: model.stores[index].address as String?,
                      phone: model.stores[index].phone as String?,
                      time: model.stores[index].time as String?,
                      coords: [model.stores[index].longitude, model.stores[index].latitude],
                      indexStore: index,
                    );
                  }
              )
          );
        },
      ),
    );
  }
}