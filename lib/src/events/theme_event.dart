import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class FetchTheme extends ThemeEvent {
  @override
  List<Object> get props => [];
}

class ToggleTheme extends ThemeEvent {
  final String val;

  const ToggleTheme({@required this.val});

  @override
  List<Object> get props => [val];

  @override
  String toString() => 'ToggleTheme { val: $val }';
}
