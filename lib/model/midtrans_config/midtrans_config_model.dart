import 'package:json_annotation/json_annotation.dart';
import 'package:midtrans_flutter_sdk/model/color/color_theme_model.dart';

part 'midtrans_config_model.g.dart';

/// Represents the configuration settings for the Midtrans Flutter SDK.
///
/// This class contains parameters such as client key, merchant base URL,
/// language, color theme, and log enabling status.
@JsonSerializable(explicitToJson: true)
class MidtransConfig {
  /// The client key obtained from Midtrans.
  final String clientKey;

  /// The base URL of the merchant's server.
  final String merchantBaseUrl;

  /// The language code used for localization (default is 'id' for Indonesian).
  final String language;

  /// The color theme for customizing the payment UI.
  final ColorTheme? colorTheme;

  /// A flag indicating whether logging is enabled or not (default is true).
  final bool enableLog;

  /// Constructs a [MidtransConfig] instance.
  ///
  /// [clientKey] The client key obtained from Midtrans.
  ///
  /// [merchantBaseUrl] The base URL of the merchant's server.
  ///
  /// [language] The language code used for localization (default is 'id').
  ///
  /// [colorTheme] The color theme for customizing the payment UI.
  ///
  /// [enableLog] A flag indicating whether logging is enabled (default is true).
  MidtransConfig({
    required this.clientKey,
    required this.merchantBaseUrl,
    this.language = 'id',
    this.colorTheme,
    this.enableLog = true,
  });

  /// Creates a [MidtransConfig] instance from a JSON map.
  factory MidtransConfig.fromJson(Map<String, dynamic> json) =>
      _$MidtransConfigFromJson(json);

  /// Converts this [MidtransConfig] instance to a JSON map.
  Map<String, dynamic> toJson() => _$MidtransConfigToJson(this);
}
