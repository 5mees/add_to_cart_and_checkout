import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/checkout.dart';
import 'package:test_app/model/cart.dart';

import 'model/itme.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Item> items = [
    Item(name: "S20+", price: 500),
    Item(name: 'IPhone 12', price: 600)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Phone'),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return Checkout();
                      },
                    ));
                  },
                  icon: const Icon(Icons.add_shopping_cart)),
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Consumer<Cart>(
                    builder: (context, value, child) {
                      return Text('${value.count}');
                    },
                  ))
            ],
          )
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              return Card(child: Consumer<Cart>(
                builder: (context, value, child) {
                  return ListTile(
                    title: Text(items[i].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        value.addToCart(items[i]);
                      },
                    ),
                    subtitle: Text('${items[i].price}'),
                  );
                },
              ));
            }),
      ),
    );
  }
}
