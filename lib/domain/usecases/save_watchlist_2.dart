import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class SaveWatchlist2 {
  final TvRepository repository;

  SaveWatchlist2(this.repository);

  Future<Either<Failure, String>> execute(TvDetail tv) {
    return repository.saveWatchlist(tv);
  }
}
