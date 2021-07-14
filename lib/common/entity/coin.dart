import 'package:hive/hive.dart';

import '../models/base_model.dart';

part 'coin.g.dart';

@HiveType(typeId: 0)
class Coin extends BaseModel {
  Coin({
    this.uuid,
    this.symbol,
    this.name,
    this.description,
    this.iconUrl,
    this.marketCap,
    this.price,
    this.rank,
  }) : super.fromJson();

  Coin.fromJson(Map<String, dynamic>? json) : super.fromJson() {
    if (json == null) {
      return;
    }

    uuid = json['uuid'];
    symbol = json['symbol'];
    name = json['name'];
    description = json['description'];
    iconUrl = json['iconUrl'];
    marketCap = json['marketCap'];
    price = json['price'];
    rank = json['rank'];
  }

  @HiveField(0)
  late String? uuid;
  @HiveField(1)
  late String? symbol;
  @HiveField(2)
  late String? name;
  @HiveField(3)
  late String? description;
  @HiveField(4)
  late String? iconUrl;
  @HiveField(5)
  late String? marketCap;
  @HiveField(6)
  late String? price;
  @HiveField(7)
  late int? rank;
  @HiveField(8)
  late bool isFavorite = false;
  @HiveField(9)
  int index = 0;

  String get key => uuid!.length > 255 ? uuid!.substring(0, 255) : uuid!;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uuid': uuid,
      'symbol': symbol,
      'name': name,
      'description': description,
      'iconUrl': iconUrl,
      'marketCap': marketCap,
      'price': price,
      'rank': rank,
    };
  }

  @override
  String toString() {
    return 'Coin{ uuid: $uuid, symbol: $symbol, name: $name, description: $description, iconUrl: $iconUrl, marketCap: $marketCap, price: $price, rank: $rank}';
  }

  @override
  getValue() {
    throw UnimplementedError();
  }

  @override
  void setValue(value) {
  }

  void changeFavorite(bool value) {
    isFavorite = value;
  }
}
