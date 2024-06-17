import 'package:flutter/cupertino.dart';
import 'package:musicplayer/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        songName: "Champions League",
        artistName: "Marwan Moussa",
        albumArtImagePath: "assets/images/Champions League.jpeg",
        audioPath: "assets/audio/CHAMPIONS LEAGUE.mp3"),
    Song(
        songName: "Lelly Yah",
        artistName: "Marwan Pablo",
        albumArtImagePath: "assets/images/Lelly Yah.jpeg",
        audioPath: "assets/audio/Lelly Yah - Marwan Pablo.mp3"),
    Song(
        songName: "Messi",
        artistName: "Abo El Anwar",
        albumArtImagePath: "assets/images/Messi.jpeg",
        audioPath: "assets/audio/Abo El Anwar - Messi.mp3"),
  ];

  int? _currentPlayingIndex;

  // getter
  List<Song> get playlist => _playlist;

  int? get currentPlayingIndex => _currentPlayingIndex;

  // setter
  set currentPlayingIndex(int? newIndex) {
    _currentPlayingIndex = newIndex;

    notifyListeners();
  }
}
