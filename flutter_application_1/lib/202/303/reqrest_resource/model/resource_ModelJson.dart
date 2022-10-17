//import 'package:json_annotation/json_annotation.dart';
//Hangi classlardan üretim yapılacaksa başına jsonSerializable koy
//Üretilmesi için part :dosya adı.g.dart
import 'package:json_annotation/json_annotation.dart';

part 'resoruce_model.g.dart';

//Eğer bu metotdan bir tane servise istek atmayacaksan
//fromjsonu statik olarak yazılır
String _fetchCustom(String data) {
  return 'a';
}
//datalar bi harfi büyük küçük gelirse:fieldRename otomatik parse eder

@JsonSerializable(createToJson: false, fieldRename: FieldRename.kebab)
class ResourceModel {
  List<Data>? data;
  ResourceModel({this.data});

  factory ResourceModel.fromJSON(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ResourceModelToJson(this);
  }
}

//Equtable:eşit eşit demek
@JsonSerializable()
class Data extends Equtable {
  int? id;
  //fromjsonu statik olarak yazılır
  @JsonKey(fromJson: _fetchCustom)
  String? name;
  //Türkçe karakter yazmışsa
  @JsonKey(name: 'renk')
  int? year;
  String? color;
  String? pantoneValue;
  final StatusCode status;

  Data(
    this.status, {
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  //equtable data
  List<Object?> get props => [id, name, year];
  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

enum StatusCode {
  @JsonSerializable(200)
  success,
  @JsonSerializable(500)
  weird,
}
