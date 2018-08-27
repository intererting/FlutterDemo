import 'package:flutter/material.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter_demo/music/mp_inherited.dart';
import 'package:flutter_demo/music/root_page.dart';
import 'package:flutter_demo/music/song_data.dart';

class InstaHome extends StatefulWidget {
  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  SongData songData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return new MPInheritedWidget(songData, _isLoading, new RootPage());
  }

  initPlatformState() async {
    _isLoading = true;

    var songs;

    try {
      songs = await MusicFinder.allSongs();
    } catch (e) {
      print("Failed to get songs: '${e.message}'.");
    }

    if (!mounted) return;

    setState(() {
      songData = new SongData(songs);
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    songData.audioPlayer.stop();
  }
}
