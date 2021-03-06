import 'package:ditonton/presentation/pages/about_page.dart';
import 'package:ditonton/presentation/pages/home_movie_page.dart';
import 'package:ditonton/presentation/pages/home_tv_page.dart';
import 'package:ditonton/presentation/pages/watchlist_movies_page.dart';
import 'package:ditonton/presentation/pages/watchlist_tv_page.dart';
import 'package:flutter/material.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/circle-g.png'),
          ),
          accountName: Text('Ditonton'),
          accountEmail: Text('ditonton@dicoding.com'),
        ),
        ListTile(
          leading: Icon(Icons.movie),
          title: Text('Movies'),
          onTap: () {
            // Navigator.pop(context);
            Navigator.pushNamed(context, HomeMoviePage.ROUTE_NAME);
          },
        ),
        ListTile(
          leading: Icon(Icons.tv),
          title: Text('TV Series'),
          onTap: () {
            Navigator.pushNamed(context, HomeTvPage.ROUTE_NAME);
          },
        ),
        ListTile(
          leading: Icon(Icons.save_alt),
          title: Text('Watchlist Movie'),
          onTap: () {
            Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
          },
        ),
        ListTile(
          leading: Icon(Icons.save_alt),
          title: Text('Watchlist TV'),
          onTap: () {
            Navigator.pushNamed(context, WatchlistTvPage.ROUTE_NAME);
          },
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
          },
          leading: Icon(Icons.info_outline),
          title: Text('About'),
        ),
      ],
    ),
  );
}