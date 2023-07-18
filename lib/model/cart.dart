import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cart.g.dart';

@HiveType(typeId: 0)
class Cart extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  dynamic image;

  @HiveField(3)
  int price;


  

  @HiveField(4)
  ValueNotifier<int> quantity = ValueNotifier(1);

  Cart({
    required this.id,
    required this.image,
    required this.price,
    required this.title,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
       'itemId': id,
       'item Name': title,
       'image': image,
       'item Price': price,
       'quantity': quantity,
    };
  }
}

//since hive accept primitive types like int, double, String, bool, as well as other commonly used types like DateTime and Uint8List. This class is to make the valuenotifier<int> type acceptable and also be serialze and deserialize objects of custom types
class ValueNotifierAdapter extends TypeAdapter<ValueNotifier<int>> {
  @override
  final int typeId = 100;

  @override
  ValueNotifier<int> read(BinaryReader reader) {
    return ValueNotifier<int>(reader.readInt());
  }

  @override
  void write(BinaryWriter writer, ValueNotifier<int> obj) {
    writer.writeInt(obj.value);
  }
}