import 'package:flutter/material.dart';
import 'package:bittaqwa_ghaisan/models/video_kajian_model.dart';
import 'package:bittaqwa_ghaisan/presentation/screen/dashboard_screen.dart';
import 'package:bittaqwa_ghaisan/screens/detail_kajian_screen.dart';

class VideoKajianScreen extends StatelessWidget {
  const VideoKajianScreen({super.key});

  void _navigateBackToDashboard(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _navigateBackToDashboard(context);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7FA),
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF8C53),
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              _navigateBackToDashboard(context);
            },
          ),
          title: const Text(
            "Video Kajian",
            style: TextStyle(
              fontFamily: 'PoppinsSemiBold',
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 14),
          itemCount: listVideoKajian.length,
          itemBuilder: (context, index) {
            final video = listVideoKajian[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    // Navigasi ke DetailKajianScreen saat card video diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailKajianScreen(video: video),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gambar Thumbnail Video asli dari YouTube (fallback ke asset lokal jika offline)
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              video.youtubeThumbnail,
                              width: double.infinity,
                              height: 195,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      width: double.infinity,
                                      height: 195,
                                      color: Colors.grey.shade200,
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xFFFF8C53),
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    );
                                  },
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  video.thumbnail,
                                  width: double.infinity,
                                  height: 195,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                            // Overlay Tombol Play
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.55),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 38,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Nama Channel
                            Text(
                              video.channel,
                              style: TextStyle(
                                fontFamily: 'PoppinsRegular',
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 3),
                            // Nama Ustadz / Pembicara
                            Text(
                              video.ustadz,
                              style: const TextStyle(
                                fontFamily: 'PoppinsMedium',
                                fontSize: 13,
                                color: Color(0xFFFF8C53),
                              ),
                            ),
                            const SizedBox(height: 2),
                            // Judul Video Kajian
                            Text(
                              video.title,
                              style: const TextStyle(
                                fontFamily: 'PoppinsBold',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
