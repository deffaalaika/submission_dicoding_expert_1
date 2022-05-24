import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv_table.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/entities/tv_detail.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testTv = Tv(
  backdropPath: '/bZGAX8oMDm3Mo5i0ZPKh9G2OcaO.jpg',
  firstAirDate: '2021-06-09',
  genreIds: [18, 10765],
  id: 84958,
  name: 'Loki',
  originCountry: [
    'US',
  ],
  originalLanguage: 'en',
  originalName: 'Loki',
  overview:
      'After stealing the Tesseract during the events of “Avengers: Endgame,” an alternate version of Loki is brought to the mysterious Time Variance Authority, a bureaucratic organization that exists outside of time and space and monitors the timeline. They give Loki a choice: face being erased from existence due to being a “time variant” or help fix the timeline and stop a greater threat.',
  popularity: 234.927,
  posterPath: '/kEl2t3OhXc3Zb9FBh1AuYzRTgZp.jpg',
  voteAverage: 8.2,
  voteCount: 8854,
);

final testMovieList = [testMovie];
final testTvList = [testTv];

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testTvDetail = TvDetail(
  backdropPath: '/bZGAX8oMDm3Mo5i0ZPKh9G2OcaO.jpg',
  firstAirDate: '2021-06-09',
  genres: [
    Genre(id: 18, name: 'Drama'),
    Genre(id: 10765, name: 'Sci-Fi & Fantasy'),
  ],
  homepage: 'https://www.disneyplus.com/series/wp/6pARMvILBGzF',
  id: 84958,
  inProduction: true,
  lastAirDate: '2021-07-14',
  name: 'Loki',
  nextEpisodeToAir: 'null',
  numberOfEpisodes: 6,
  numberOfSeasons: 1,
  originalLanguage: 'en',
  originalName: 'Loki',
  overview:
      'After stealing the Tesseract during the events of “Avengers: Endgame,” an alternate version of Loki is brought to the mysterious Time Variance Authority, a bureaucratic organization that exists outside of time and space and monitors the timeline. They give Loki a choice: face being erased from existence due to being a “time variant” or help fix the timeline and stop a greater threat.',
  popularity: 234.927,
  posterPath: '/kEl2t3OhXc3Zb9FBh1AuYzRTgZp.jpg',
  status: 'Returning Series',
  tagline: "'Loki's time has come.'",
  type: 'scripted',
  voteAverage: 8.2,
  voteCount: 8854,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testWatchlistTv = Tv.watchlist(
  id: 1,
  overview: 'overview',
  posterPath: 'posterPath',
  name: 'name',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvTable = TvTable(
  id: 1,
  name: 'name',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final testTvMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'name': 'name',
};
