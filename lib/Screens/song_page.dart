import 'package:flutter/material.dart';
import 'package:musicplayer/components/image_box.dart';
import 'package:musicplayer/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  String formatTime (Duration duration){
    String twodigitseconds = duration.inSeconds.remainder (60). toString().padLeft(2,"0");
    String formattedTime = "${duration .inMinutes}:$twodigitseconds";
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {

        final playlist = value.playlist;

        final currentSong = playlist[value.currentPlayingIndex ?? 0];

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            title: const Text("Playlist"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      ImageBox(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                currentSong.albumArtImagePath,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentSong.songName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(currentSong.artistName),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(formatTime(value.currentDuration)),
                                Icon(Icons.shuffle),
                                Icon(Icons.repeat),
                                Text(formatTime(value.totalDuration)),
                              ],
                            ),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 0),
                            ),
                            child: Slider(
                              min: 0,
                              max: value.totalDuration.inSeconds.toDouble(),
                              value: value.currentDuration.inSeconds.toDouble(),
                              onChanged: (double double) {

                              },
                              onChangeEnd: (double double) {
                                value.seek(Duration(seconds: double.toInt()));
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: value.playPreviousSong,
                                  child: const ImageBox(
                                    child: Icon(Icons.skip_previous),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: value.pauseOrResume,
                                  child: ImageBox(
                                    child: Icon(value.isPlaying ? Icons.pause: Icons.play_arrow,),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: value.playNextSong,
                                  child: const ImageBox(
                                    child: Icon(Icons.skip_next),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
