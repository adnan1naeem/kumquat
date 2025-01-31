import 'package:equatable/equatable.dart';
import 'package:kumquat_app/src/data/models/json_doc.dart';

import '../../domain/services/data_service.dart';

class BaseModel extends Equatable {
  static DataService adapter = DataService();

  const BaseModel({required this.jsonDoc});

  final JsonDoc jsonDoc;

  dynamic get data => jsonDoc.data;

  @override
  List<Object?> get props => [jsonDoc];

  @override
  bool get stringify => true;
}
