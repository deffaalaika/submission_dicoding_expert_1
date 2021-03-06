import 'package:ditonton/presentation/provider/top_rated_tv_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/state_enum.dart';
import '../widgets/tv_card_list.dart';

class TopRatedTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/top-rated-tv';
const  TopRatedTvPage({Key? key}) : super(key: key);

  @override
  _TopRatedTvPageState createState() {
    return _TopRatedTvPageState();
  }
}

class _TopRatedTvPageState extends State<TopRatedTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TopRatedTvNotifier>(context, listen: false)
            .fetchTopRatedTv());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Rated Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TopRatedTvNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = data.tv[index];
                  return TvCard(tv);
                },
                itemCount: data.tv.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}