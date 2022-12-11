import 'package:dartz/dartz.dart';

import '../error/failuer.dart';

abstract class UseCase<In, Out> {
 Future< Either<Failuer, Out>> excute({required In input});
}
