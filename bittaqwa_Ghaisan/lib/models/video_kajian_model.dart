class VideoKajianModel {
  final String id;
  final String title;
  final String ustadz;
  final String channel;
  final String url;
  final String youtubeId;
  final String thumbnail;
  final String description;

  const VideoKajianModel({
    required this.id,
    required this.title,
    required this.ustadz,
    required this.channel,
    required this.url,
    required this.youtubeId,
    required this.thumbnail,
    required this.description,
  });

  // URL thumbnail asli langsung dari YouTube
  String get youtubeThumbnail =>
      'https://img.youtube.com/vi/$youtubeId/hqdefault.jpg';
}

final List<VideoKajianModel> listVideoKajian = [
  const VideoKajianModel(
    id: "1",
    title: "Hadiah Allah Ketika Mengalami Kesulitan",
    ustadz: "Ustadz Adi Hidayat",
    channel: "Adi Hidayat Official",
    url: "https://youtu.be/izYUMrsvVDQ",
    youtubeId: "izYUMrsvVDQ",
    thumbnail: "assets/image/thumbnail_video_kajian_1.jpg",
    description: "Pesan utamanya adalah kesulitan hidup bukan alasan untuk kehilangan harapan. Kita harus menghadapi masalah dengan tenang, sabar, dan yakin kepada pertolongan Allah. Surah Ad-Dhuha dan Al-Insyirah memberikan pelajaran tentang keteguhan hati ketika menghadapi masa sulit. Jangan terlalu larut dalam masalah dunia, tetapi tetap berusaha mencari solusi dan mendekatkan diri kepada Allah.",
  ),
  const VideoKajianModel(
    id: "2",
    title: "Jangan Menyiksa Diri Mu Dengan Pikiranmu",
    ustadz: "Ustadz Khalid Basalamah",
    channel: "Khalid Basalamah Official",
    url: "https://youtu.be/N8pfZbuPC30",
    youtubeId: "N8pfZbuPC30",
    thumbnail: "assets/image/thumbnail_video_kajian_2.jpg",
    description: "Setiap kejadian, baik yang menyenangkan maupun menyakitkan, merupakan bagian dari takdir Allah. Seorang Muslim harus belajar menerima keputusan Allah dengan ikhlas, bukan marah atau menyalahkan takdir. Cobaan juga dapat menjadi jalan untuk menghapus dosa, meningkatkan keimanan, dan mendekatkan diri kepada Allah. Kesabaran dan keridaan merupakan sikap penting dalam menghadapi ujian.",
  ),
  const VideoKajianModel(
    id: "3",
    title: "Perbaiki Kualitas Shalatmu",
    ustadz: "Ustadz Adi Hidayat",
    channel: "Adi Hidayat Official",
    url: "https://youtu.be/sX-kePnlgy4",
    youtubeId: "sX-kePnlgy4",
    thumbnail: "assets/image/thumbnail_video_kajian_3.jpg",
    description: "Shalat bukan sekadar kewajiban, melainkan bentuk hubungan seorang hamba dengan Allah. Dengan memperbaiki kualitas shalat, seseorang belajar menjadi lebih disiplin, tenang, dan memiliki arah dalam menjalani kehidupan. Shalat juga menjadi sarana mengevaluasi diri agar aktivitas sehari-hari tetap sesuai dengan ajaran Islam.",
  ),
  const VideoKajianModel(
    id: "4",
    title: "Ketenangan Hati",
    ustadz: "Ustadz Khalid Basalamah",
    channel: "Khalid Basalamah Official",
    url: "https://youtu.be/0ZgTjHL92yg",
    youtubeId: "0ZgTjHL92yg",
    thumbnail: "assets/image/thumbnail_video_kajian_4.jpg",
    description: "Ketenangan hati merupakan anugerah besar yang harus dimohonkan kepada Allah. Jangan hanya meminta kekayaan dan kesenangan dunia, tetapi mintalah kelapangan hati dan ketenangan jiwa. Hati perlu dijaga dari kebencian, dendam, dan terlalu mencintai urusan dunia. Memperbanyak zikir dan mengingat Allah menjadi salah satu cara mendekatkan diri kepada ketenangan.",
  ),
  const VideoKajianModel(
    id: "5",
    title: "Orang Yang Di Dabulkan Doanya",
    ustadz: "Ustadz Adi Hidayat",
    channel: "Adi Hidayat Official",
    url: "https://youtu.be/YzV3GBb_1IM",
    youtubeId: "YzV3GBb_1IM",
    thumbnail: "assets/image/thumbnail_video_kajian_5.jpg",
    description: "Doa merupakan salah satu cara seorang hamba memohon pertolongan dan rahmat Allah. Dalam berdoa, kita harus memperhatikan waktu, niat, dan adabnya. Awali dengan memuji Allah, menyebut Asmaul Husna, serta berselawat kepada Nabi Muhammad SAW. Jangan lupa bersyukur karena terkadang jawaban doa hadir dalam bentuk perubahan positif yang tidak kita sadari. Allah juga dapat memberikan sesuatu yang berbeda dari apa yang kita minta karena Dia lebih mengetahui kebutuhan hamba-Nya.",
  ),
];
