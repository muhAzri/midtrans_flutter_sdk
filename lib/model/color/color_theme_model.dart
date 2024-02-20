import 'dart:ui';
import 'package:json_annotation/json_annotation.dart';
import 'package:midtrans_flutter_sdk/utils/converter.dart';

part 'color_theme_model.g.dart';

@JsonSerializable()
class ColorTheme {
  @ColorConverter()
  Color? colorPrimary;
  @ColorConverter()
  Color? colorPrimaryDark;
  @ColorConverter()
  Color? colorSecondary;

  ColorTheme({this.colorPrimary, this.colorPrimaryDark, this.colorSecondary});

  factory ColorTheme.fromJson(Map<String, dynamic> json) =>
      _$ColorThemeFromJson(json);
  Map<String, dynamic> toJson() => _$ColorThemeToJson(this);
}