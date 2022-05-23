import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/popular_tv_page.dart';
import 'package:ditonton/presentation/pages/search_page_2.dart';
import 'package:ditonton/presentation/pages/top_rated_tv_page.dart';
import 'package:ditonton/presentation/provider/tv_list_notifier.dart';
import 'package:ditonton/presentation/widgets/drawer.dart';
import 'package:ditonton/presentation/widgets/sub_heading.dart';
import 'package:ditonton/presentation/widgets/tv_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/home_tv_pages';

  const HomeTvPage({Key? key}) : super(key: key);

  @override
  _HomeTvPageState createState() {
    return _HomeTvPageState();
  }
}

class _HomeTvPageState extends State<HomeTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<TvListNotifier>(context, listen: false)
      ..fetchOnAirTv()
      ..fetchPopularTv()
      ..fetchTopRatedTv());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage2.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'On Air Tv',
                style: kHeading6,
              ),
              Consumer<TvListNotifier>(
                builder: (context, data, child) {
                  final state = data.onAirState;
                  if (state == RequestState.Loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state == RequestState.Loaded) {
                    return TvList(data.onAirTv);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
              buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularTvPage.ROUTE_NAME),
              ),
              Consumer<TvListNotifier>(
                builder: (context, data, child) {
                  final state = data.popularTvState;
                  if (state == RequestState.Loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state == RequestState.Loaded) {
                    return TvList(data.popularTv);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
              buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedTvPage.ROUTE_NAME),
              ),
              Consumer<TvListNotifier>(
                builder: (context, data, child) {
                  final state = data.topRatedTvState;
                  if (state == RequestState.Loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state == RequestState.Loaded) {
                    return TvList(data.topRatedTv);
                  } else {
                    return Text('Failed');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
