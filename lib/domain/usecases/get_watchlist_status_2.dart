import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetWatchListStatus2 {
  final TvRepository repository;

  GetWatchListStatus2(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToWatchlist(id);
  }
}
