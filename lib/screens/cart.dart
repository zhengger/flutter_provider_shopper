import 'package:flutter/material.dart';
import 'package:provider_example/models/cart.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.display4),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: new _CartList(),
              ),
            ),
            Container(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// In the current implementation, this screen doesn't allow the user
    /// to modify the contents of the cart, and the cart can't change
    /// from the outside (it's not synchronized with a database, for example).
    /// Therefore, the model can't change while we're on this screen.
    ///
    /// But because it's practically guaranteed that we'll want the cart screen
    /// to be dynamic (allow removing items, changing counts, clearing, etc.)
    /// we use ScopedModelDescendant here.
    ///
    /// This makes sure the cart will always list the current contents of
    /// the cart.
    return ListView(
            // Take the items in the current cart.
            children: Provider.of<CartModel>(context).items
                // For each of them, create a Text widget.
                .map((item) => Text(
                      '· ${item.name}',
                      style: Theme.of(context).textTheme.title,
                    ))
                // Then make a list of these widgets.
                .toList(),
    );
  }
}

/// This is the bottom part of the cart screen, showing the price.
class _CartTotal extends StatelessWidget {
  const _CartTotal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('\$${Provider.of<CartModel>(context).totalPrice}',
                    style: Theme.of(context)
                        .textTheme
                        .display4
                        .copyWith(fontSize: 48)),
            SizedBox(width: 24),
            FlatButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Buying not supported yet.')));
              },
              color: Colors.white,
              child: Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}
