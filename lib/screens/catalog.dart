import 'package:flutter/material.dart';
import 'package:provider_example/models/cart.dart';
import 'package:provider_example/models/src/item.dart';
import 'package:provider/provider.dart';


/// The app bar in the catalog.
///
/// No need to access shared state here.
class MyAppBar extends StatelessWidget {
  // ignore: public_member_api_docs
  const MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.display4),
      floating: true,
      actions: [
        IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart')),
      ],
    );
  }
}

/// The catalog screen itself, with its app bar and an infinite list of items.
///
/// No need to access shared state here.
class MyCatalog extends StatelessWidget {
  MyCatalog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MyAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => MyListItem(index)),
          ),
        ],
      ),
    );
  }
}

/// An item in the catalog.
///
/// It allows adding its [item] to cart via the [_AddButton] widget.
class MyListItem extends StatelessWidget {
  final int index;

  final Item item;

  MyListItem(
    this.index, {
    Key key,
  })  : item = Item(index),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.primaries[index % Colors.primaries.length],
              ),
            ),
            SizedBox(width: 24),
            Expanded(
              child: Text(item.name, style: Theme.of(context).textTheme.title),
            ),
            SizedBox(width: 24),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

/// The button that says 'ADD' or 'ADDED' depending on whether the item
/// is already in cart. When it isn't, the button is enabled, and calls
/// [CartModel.add()] when tapped.
class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({
    Key key,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Here is where we access the shared state of the cart. Because we
    // need to change the UI here according to the contents of the cart,
    // we use the ScopedModelDescendant widget (instead of ScopedModel.of).
    return FlatButton(
            // We check whether the cart already has the item in it,
            // and if so, we give `null` to onPressed (making it disabled).
            // Otherwise, we provide a callback that calls a method
            // on the cart model.
            onPressed: Provider.of<CartModel>(context).items.contains(item) ? null : () => Provider.of<CartModel>(context).items.add(item),
            splashColor: Colors.yellow,
            // Similarly, we change the content of the button according
            // to the state of the cart.
            child: Provider.of<CartModel>(context).items.contains(item) ? Icon(Icons.check) : Text('ADD'),
    );
  }
}
