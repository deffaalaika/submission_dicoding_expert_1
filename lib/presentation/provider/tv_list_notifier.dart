import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/get_on_air_tv.dart';
import 'package:ditonton/domain/usecases/get_popular_tv.dart';
import 'package:ditonton/domain/usecases/get_top_rated_tv.dart';
import 'package:flutter/foundation.dart';

class TvListNotifier extends ChangeNotifier {
  final GetOnAirTv getOnAirTv;
  final GetPopularTv getPopularTv;
  final GetTopRatedTv getTopRatedTv;

  TvListNotifier({
    required this.getOnAirTv,
    required this.getPopularTv,
    required this.getTopRatedTv,
  });

  var _onAirTv = <Tv>[];

  List<Tv> get onAirTv => _onAirTv;

  RequestState _onAirState = RequestState.Empty;

  RequestState get onAirState => _onAirState;

  var _popularTv = <Tv>[];

  List<Tv> get popularTv => _popularTv;

  RequestState _popularTvState = RequestState.Empty;

  RequestState get popularTvState => _popularTvState;

  var _topRatedTv = <Tv>[];

  List<Tv> get topRatedTv => _topRatedTv;

  RequestState _topRatedTvState = RequestState.Empty;

  RequestState get topRatedTvState => _topRatedTvState;

  String _message = '';

  String get message => _message;

  Future<void> fetchOnAirTv() async {
    _onAirState = RequestState.Loading;
    notifyListeners();

    final result = await getOnAirTv.execute();
    result.fold(
      (failure) {
        _onAirState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvData) {
        _onAirState = RequestState.Loaded;
        _onAirTv = tvData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularTv() async {
    _popularTvState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTv.execute();
    result.fold(
      (failure) {
        _popularTvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvData) {
        _popularTvState = RequestState.Loaded;
        _popularTv = tvData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedTv() async {
    _topRatedTvState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTv.execute();
    result.fold(
      (failure) {
        _topRatedTvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvData) {
        _topRatedTvState = RequestState.Loaded;
        _topRatedTv = tvData;
        notifyListeners();
      },
    );
  }
}
