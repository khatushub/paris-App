import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'cool.dart';

class RecipeDetailScreen extends StatefulWidget {
  const RecipeDetailScreen({Key? key}) : super(key: key);

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {

  final videoUrl = 'https://youtu.be/RmnRF_lNDbA?si=-XohVEGSrMWdtDno';

  late YoutubePlayerController _controller;


  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  bool isScrolled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black.withBlue(1),
        onPressed: () {},
        isExtended: isScrolled,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        label: const Text('Search Flights'),
        icon: const Icon(Icons.local_airport_sharp, size: 40,),
      ),

      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.reverse) {
            setState(() {
              isScrolled = true;
            });
          } else if (notification.direction == ScrollDirection.forward) {
            setState(() {
              isScrolled = false;
            });
          }
          return true;
        },
        child: CustomScrollView(
          slivers: <Widget>[
            const RecipeDetailAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image.asset(
                            "lib/images/image.png",
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            "lib/images/image.png",
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            "lib/images/image.png",
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            "lib/images/image.png",
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            "lib/images/image.png",
                            height: 100,
                            width: 100,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Image.asset(
                            "lib/images/image.png",
                            height: 100,
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Text(
                      'When the French government was organizing the International Exposition of 1889 to celebrate the centenary of the French Revolution, a competition was held for designs for a suitable monument.',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    const SizedBox(height: 15,),
                    const Center(child: Text('Read More', style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),)),
                    const SizedBox(height: 15,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: YoutubePlayer(
                        controller: _controller
                        , showVideoProgressIndicator: true,
                        bottomActions: [
                          CurrentPosition(),
                          ProgressBar(
                            isExpanded: true,
                            colors: const ProgressBarColors(
                              playedColor: Colors.blue,
                              handleColor: Colors.greenAccent,
                            ),
                          ),
                          const PlaybackSpeedButton(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Text('Top Sights', style: TextStyle(
                        color: Colors.black54,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Image.asset(
                          'lib/images/image.png', height: 150, width: 150,),
                        const Column(
                          children: [
                            Text(
                              'Eiffel Tower',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              ' When the French government',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                // fontSize: 10
                              ),
                            ),
                            Text(
                              'was organizing the',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                //fontSize: 10
                              ),
                            ),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}