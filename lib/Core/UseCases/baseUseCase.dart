import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_application/Core/Error/failure.dart';

abstract class BaseUseCases<T, Parameters> {
  // ignore: non_constant_identifier_names
  Future<Either<Failure, T>> call(
    Parameters Parameters,
  );
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
