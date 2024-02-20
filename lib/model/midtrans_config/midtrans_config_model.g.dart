// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'midtrans_config_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MidtransConfig _$MidtransConfigFromJson(Map<String, dynamic> json) =>
    MidtransConfig(
      clientKey: json['clientKey'] as String,
      merchantBaseUrl: json['merchantBaseUrl'] as String,
      language: json['language'] as String? ?? 'id',
      colorTheme: json['colorTheme'] == null
          ? null
          : ColorTheme.fromJson(json['colorTheme'] as Map<String, dynamic>),
      enableLog: json['enableLog'] as bool? ?? true,
    );

Map<String, dynamic> _$MidtransConfigToJson(MidtransConfig instance) =>
    <String, dynamic>{
      'clientKey': instance.clientKey,
      'merchantBaseUrl': instance.merchantBaseUrl,
      'language': instance.language,
      'colorTheme': instance.colorTheme?.toJson(),
      'enableLog': instance.enableLog,
    };
