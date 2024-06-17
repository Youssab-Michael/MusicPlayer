import 'package:flutter/material.dart';
import 'package:musicplayer/components/image_box.dart';
import 'package:musicplayer/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text("Playlist"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      child: ImageBox(
                        image: "assets/images/Champions League.jpeg",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Champions League",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text("Marwan Moussa"),
                            ],
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
