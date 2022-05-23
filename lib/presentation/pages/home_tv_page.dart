import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/pages/search_page.dart';
import 'package:ditonton/presentation/provider/tv_list_notifier.dart';
import 'package:ditonton/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/home_tv_page';

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
              Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
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
                  if(state == RequestState.Loading){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else if(state == RequestState.Loaded){

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
