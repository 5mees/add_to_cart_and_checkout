import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/cart.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Checkout')),
        body: Consumer<Cart>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.itmesbasket.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(value.itmesbasket[index].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        value.removeCart(value.itmesbasket[index]);
                      },
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
