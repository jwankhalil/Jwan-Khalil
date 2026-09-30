import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.messageKey);

  final String messageKey;

  @override
  List<Object?> get props => [messageKey];
}

class ServerFailure extends Failure {
  const ServerFailure([super.messageKey = 'errors.server']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.messageKey = 'errors.network']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.messageKey = 'errors.cache']);
}
