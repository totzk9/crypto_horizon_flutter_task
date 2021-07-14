import 'package:equatable/equatable.dart';

abstract class BaseModel {

  BaseModel.fromJson();

  DateTime? date;

  Map<String, dynamic> toJson();

  void setValue(dynamic value);

  dynamic getValue();

}
