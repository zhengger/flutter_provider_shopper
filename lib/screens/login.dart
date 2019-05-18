import 'package:flutter/material.dart';
// import 'package:model_shopper/models/cart.dart';
// import 'package:scoped_model/scoped_model.dart';

/// This is the login screen.
///
/// We only access cart here in order to clear it when a new user logs in.
///
/// Sooner or later, you will want to implement actual authorization here.
/// At that time, you would create a new user model and share it
/// across screens that need it -- the same way we use cart model now.
class MyLoginScreen extends StatelessWidget {
  /// This method is called when the user taps "Enter".
  void onLoginSubmit(BuildContext context) {
    // Here the UI doesn't depend on the state of the model. We only need
    // the model to call a method on it. Therefore, we use ScopedModel.of
    // instead of a ScopedModelDescendant widget.
    // var cart = ScopedModel.of<CartModel>(context);

    // Now that we have reference to the cart, we can clear it, for example.
    // cart.clear();

    // Navigate to the catalog screen.
    Navigator.pushNamed(context, '/catalog');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome', style: Theme.of(context).textTheme.display4),
              // ignore: prefer_const_constructors
              SizedBox(height: 24),
              _LoginTextField(hintText: 'Login'),
              // ignore: prefer_const_constructors
              SizedBox(height: 12),
              _LoginTextField(hintText: 'Password', obscureText: true),
              // ignore: prefer_const_constructors
              SizedBox(height: 24),
              FlatButton(
                // Here we call the method above. We need to provide
                // `context` because that's how ScopedModel.of() reaches
                // the model.
                onPressed: () => onLoginSubmit(context),
                color: Colors.yellow,
                child: Text('ENTER'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Convenience widget for the login text fields.
class _LoginTextField extends StatelessWidget {
  final String hintText;

  final bool obscureText;

  _LoginTextField({
    Key key,
    @required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.black12,
      ),
      obscureText: obscureText,
    );
  }
}
