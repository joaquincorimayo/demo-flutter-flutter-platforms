import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/app_state.dart';
import 'home_page.dart';

// From https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw
const flutterDevAccountId = 'UCwXdFgeE9KYzlDdR7TG9cMw';
// From YouTube Data API
const youTubeApiKey = 'AIzaNotAnApiKey';

void main() {
  if (youTubeApiKey == 'AIzaNotAnApiKey') {
    if (kDebugMode) {
      print('youTubeApiKey has not been configured.');
    }
    exit(1);
  }

  runApp(ChangeNotifierProvider<FlutterDevPlaylists>(
    create: (context) => FlutterDevPlaylists(
      flutterDevAccountId: flutterDevAccountId,
      youTubeApiKey: youTubeApiKey,
    ),
    child: const PlaylistsApp(),
  ));
}
