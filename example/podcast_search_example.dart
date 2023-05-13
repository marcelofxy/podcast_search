// Copyright (c) 2019 Ben Hills and the project contributors. Use of this source
// code is governed by a MIT license that can be found in the LICENSE file.

import 'package:podcast_search/podcast_search.dart';

void main() async {
  var search = Search();

  /// Search for podcasts with 'widgets' in the title.
  var results = await search.search('widgets', country: Country.unitedKingdom, limit: 10);

  /// List the name of each podcast found.
  results.items.forEach((result) {
    print('Found podcast: ${result.trackName}');
  });

  /// Parse the first podcast.
  var podcast = await Podcast.loadFeed(url: results.items[0].feedUrl!);

  /// Display episode titles.
  podcast.episodes?.forEach((episode) {
    print('Episode title: ${episode.title}');
  });

  /// Find the top 10 podcasts in the UK.
  var charts = await search.charts(limit: 10, country: Country.unitedKingdom);

  /// List the name of each podcast found.
  charts.items.forEach((result) {
    print('Episode title: ${result.trackName}');
  });
}
