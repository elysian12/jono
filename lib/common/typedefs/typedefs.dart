import 'package:jono/common/errors/result_error.dart';
import 'package:multiple_result/multiple_result.dart';

typedef FutureResult<T> = Future<Result<T, ResultError>>;
