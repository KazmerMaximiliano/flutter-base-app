import 'package:equatable/equatable.dart';

abstract class CustomError extends Equatable {
  const CustomError([this.properties = const <dynamic>[]]) : super();

  final List<dynamic> properties;

  @override
  List<dynamic> get props => properties;
}

class ServerError extends CustomError {}
