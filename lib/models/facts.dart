import 'package:json_annotation/json_annotation.dart';

part 'facts.g.dart';

@JsonSerializable()
class facts {
  Status? status;
  String? sId;
  String? user;
  String? text;
  int? iV;
  String? source;
  String? updatedAt;
  String? type;
  String? createdAt;
  bool? deleted;
  bool? used;

  facts(
      {this.status,
      this.sId,
      this.user,
      this.text,
      this.iV,
      this.source,
      this.updatedAt,
      this.type,
      this.createdAt,
      this.deleted,
      this.used});

  factory facts.fromJson(Map<String, dynamic> json) => _$factsFromJson(json);
  Map<String, dynamic> toJson() => _$factsToJson(this);
}

@JsonSerializable()
class Status {
  bool? verified;
  String? feedback;
  int? sentCount;

  Status({this.verified, this.feedback, this.sentCount});

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}


//command - flutter pub run build_runner build --delete-conflicting-outputs
