part of 'scan_cubit.dart';

@immutable
abstract class ScanState extends Equatable {}

class ScanInitial extends ScanState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ScanSuccess extends ScanState {
  String result;
  ScanSuccess({required this.result});

  @override
  List<String> get props => [result];
}

class ScanError extends ScanState {
  final String message;
  ScanError({required this.message});
  @override
  List<String> get props => [message];
}
