import 'package:json_annotation/json_annotation.dart';

part "midtrans_ui_config_model.g.dart";

/// Represents the UI configuration settings for the Midtrans Flutter SDK.
///
/// This class contains parameters such as whether to show payment status and
/// whether the save card option is checked.
@JsonSerializable()
class MidtransUiConfigModel {
  /// A flag indicating whether to show payment status during the payment process.
  final bool showPaymentStatus;

  /// A flag indicating whether the save card option is checked by default.
  final bool saveCardChecked;

  /// Constructs a [MidtransUiConfigModel] instance.
  ///
  /// [showPaymentStatus] A flag indicating whether to show payment status.
  ///
  /// [saveCardChecked] A flag indicating whether the save card option is checked.
  MidtransUiConfigModel({
    required this.showPaymentStatus,
    required this.saveCardChecked,
  });

  /// Creates a [MidtransUiConfigModel] instance from a JSON map.
  factory MidtransUiConfigModel.fromJson(Map<String, dynamic> json) =>
      _$MidtransUiConfigModelFromJson(json);

  /// Converts this [MidtransUiConfigModel] instance to a JSON map.
  Map<String, dynamic> toJson() => _$MidtransUiConfigModelToJson(this);
}
