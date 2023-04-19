// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

facts _$factsFromJson(Map<String, dynamic> json) {
  return facts(
    status: json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
    sId: json['sId'] as String?,
    user: json['user'] as String?,
    text: json['text'] as String?,
    iV: json['iV'] as int?,
    source: json['source'] as String?,
    updatedAt: json['updatedAt'] as String?,
    type: json['type'] as String?,
    createdAt: json['createdAt'] as String?,
    deleted: json['deleted'] as bool?,
    used: json['used'] as bool?,
  );
}

Map<String, dynamic> _$factsToJson(facts instance) => <String, dynamic>{
      'status': instance.status,
      'sId': instance.sId,
      'user': instance.user,
      'text': instance.text,
      'iV': instance.iV,
      'source': instance.source,
      'updatedAt': instance.updatedAt,
      'type': instance.type,
      'createdAt': instance.createdAt,
      'deleted': instance.deleted,
      'used': instance.used,
    };

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    verified: json['verified'] as bool?,
    feedback: json['feedback'] as String?,
    sentCount: json['sentCount'] as int?,
  );
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'verified': instance.verified,
      'feedback': instance.feedback,
      'sentCount': instance.sentCount,
    };
