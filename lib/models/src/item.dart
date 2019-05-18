const _itemNames = [
  'Code Smell',
  'Control Flow',
  'Interpreter',
  'Recursion',
  'Sprint',
  'Heisenbug',
  'Spaghetti',
  'Hydra Code',
  'Off-By-One',
  'Scope',
  'Callback',
  'Closure',
  'Automata',
  'Bit Shift',
  'Currying',
];

// ignore: public_member_api_docs
class Item {
  // ignore: public_member_api_docs
  final int id;
  // ignore: public_member_api_docs
  final String name;

  // ignore: public_member_api_docs
  Item(this.id) : name = _itemNames[id % _itemNames.length];

  @override
  int get hashCode => id;

  @override
  bool operator == (dynamic other) => other is Item && other.id == id;
}
