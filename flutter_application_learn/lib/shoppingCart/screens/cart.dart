import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_learn/shoppingCart/models/cart.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            Divider(
              height: 4,
              color: Colors.black,
            ),
            _CartTotal(),
          ],
        ),
        color: Colors.deepPurple[300],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    var cart = context.watch<CartModel>();
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            cart.remove(cart.items[index]);
          },
        ),
        title: Text(
          cart.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugStyle = Theme.of(context).textTheme.headline1.copyWith(fontSize: 48);
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartModel>(
              builder: (context, cart, child) => Text(
                '\$${cart.totalPrice}',
                style: hugStyle,
              ),
            ),
            SizedBox(
              width: 24,
            ),
            TextButton(
              onPressed: () => Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("buy not supported yet"))),
              child: Text('BUY'),
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
