import 'dart:math';

dynamic sample(dynamic collection) =>
    collection.elementAt(Random().nextInt(collection.length));
