import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:bittaqwa_ghaisan/models/video_kajian_model.dart';

class DetailKajianScreen extends StatefulWidget {
  final VideoKajianModel video;

  const DetailKajianScreen({super.key, required this.video});

  @override
  State<DetailKajianScreen> createState() => _DetailKajianScreenState();
}

class _DetailKajianScreenState extends State<DetailKajianScreen> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final videoId = widget.video.youtubeId.trim().isNotEmpty
        ? widget.video.youtubeId.trim()
        : _videoIdFromUrl(widget.video.url);

    _controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        enableCaption: false,
      ),
    );
  }

  String _videoIdFromUrl(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return '';

    if (uri.host == 'youtu.be' && uri.pathSegments.isNotEmpty) {
      return uri.pathSegments.first;
    }

    final queryId = uri.queryParameters['v'];
    if (queryId != null && queryId.isNotEmpty) return queryId;

    final segments = uri.pathSegments;
    for (final prefix in ['embed', 'shorts', 'live']) {
      final index = segments.indexOf(prefix);
      if (index >= 0 && index + 1 < segments.length) {
        return segments[index + 1];
      }
    }

    return '';
  }

  @override
  void dispose() {
    unawaited(_controller.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF8C53),
        title: Text(
          widget.video.title,
          style: const TextStyle(
            fontFamily: 'PoppinsSemiBold',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(controller: _controller, aspectRatio: 16 / 9),
            StreamBuilder<YoutubePlayerValue>(
              stream: _controller.stream,
              initialData: _controller.value,
              builder: (context, snapshot) {
                final isPlaying =
                    snapshot.data?.playerState == PlayerState.playing;

                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  color: const Color(0xFFFFF4EE),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (isPlaying) {
                            _controller.pauseVideo();
                          } else {
                            _controller.playVideo();
                          }
                        },
                        icon: Icon(
                          isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          color: Colors.white,
                        ),
                        label: Text(
                          isPlaying ? 'Jeda Video' : 'Mulai Putar Video',
                          style: const TextStyle(
                            fontFamily: 'PoppinsSemiBold',
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF8C53),
                        ),
                      ),
                      Text(
                        isPlaying ? 'Memutar...' : 'Siap Diputar',
                        style: TextStyle(
                          fontFamily: 'PoppinsMedium',
                          fontSize: 12,
                          color: isPlaying
                              ? Colors.green
                              : Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.video.channel,
                    style: TextStyle(
                      fontFamily: 'PoppinsRegular',
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.video.ustadz,
                    style: const TextStyle(
                      fontFamily: 'PoppinsMedium',
                      fontSize: 14,
                      color: Color(0xFFFF8C53),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.video.title,
                    style: const TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.video.description,
                    style: const TextStyle(
                      fontFamily: 'PoppinsRegular',
                      fontSize: 14,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
