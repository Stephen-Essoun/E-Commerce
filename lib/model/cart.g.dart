// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartAdapter extends TypeAdapter<Cart> {
  @override
  final int typeId = 0;

  @override
  Cart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cart(
      id: fields[0] as int,
      image: fields[2] as dynamic,
      price: fields[3] as int,
      title: fields[1] as String,
      quantity: fields[4] as ValueNotifier<int>,
    );
  }

  @override
  void write(BinaryWriter writer, Cart obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
