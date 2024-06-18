import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:musicplayer/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        songName: "Champions League",
        artistName: "Marwan Moussa",
        albumArtImagePath: "assets/images/Champions League.jpeg",
        audioPath: "/audio/CHAMPIONS LEAGUE.mp3"),
    Song(
        songName: "Lelly Yah",
        artistName: "Marwan Pablo",
        albumArtImagePath: "assets/images/Lelly Yah.jpeg",
        audioPath: "/audio/Lelly Yah - Marwan Pablo.mp3"),
    Song(
        songName: "Messi",
        artistName: "Abo El Anwar",
        albumArtImagePath: "assets/images/Messi.jpeg",
        audioPath: "/audio/Abo El Anwar - Messi.mp3"),
  ];

  int? _currentPlayingIndex;

  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constructor
  PlaylistProvider() {
    listenToDuration();
  }

  // initially not playing
  bool _isPlaying = false;

  // play the song
  void play() async {
    final String path = _playlist[_currentPlayingIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // play next song
  void playNextSong() {
    if (_currentPlayingIndex != null) {
      if (_currentPlayingIndex! < _playlist.length - 1) {
        currentPlayingIndex = _currentPlayingIndex! + 1;
      } else {
        currentPlayingIndex = 0;
      }
    }
  }

  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentPlayingIndex! > 0) {
        currentPlayingIndex = _currentPlayingIndex! - 1;
      } else {
        currentPlayingIndex = _playlist.length - 1;
      }
    }
  }

  // listen to duration
  void listenToDuration() {
    // listen for total duration
    _audioPlayer.onDurationChanged.listen(
          (newDuration) {
        _totalDuration = newDuration;
        notifyListeners();
      },
    );
    // listen for current duration
    _audioPlayer.onPositionChanged.listen(
          (newPosition) {
        _currentDuration = newPosition;
        notifyListeners();
      },
    );

    // listen for completion
    _audioPlayer.onPlayerComplete.listen(
          (event) {
        playNextSong();
      },
    );
  }

  // dispose audio player

  // getter
  List<Song> get playlist => _playlist;

  int? get currentPlayingIndex => _currentPlayingIndex;

  bool get isPlaying => _isPlaying;

  Duration get currentDuration => _currentDuration;

  Duration get totalDuration => _totalDuration;

  // setter
  set currentPlayingIndex(int? newIndex) {
    _currentPlayingIndex = newIndex;

    if (newIndex != null) {
      play();
    }

    notifyListeners();
  }
}
