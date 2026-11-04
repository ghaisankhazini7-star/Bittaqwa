class DoaModel {
  final String title;
  final String arabic;
  final String translation;
  final String reference;

  const DoaModel({
    required this.title,
    required this.arabic,
    required this.translation,
    required this.reference,
  });
}

class DoaCategoryModel {
  final String title;
  final String icon;
  final List<DoaModel> doas;

  const DoaCategoryModel({
    required this.title,
    required this.icon,
    required this.doas,
  });
}

// Data Doa Kategori Rumah
final List<DoaModel> listDoaRumah = [
  const DoaModel(
    title: "Do’a Berpakaian",
    arabic:
        "اَلْحَمْدُ لِلَّهِ الَّذِي كَسَانِي هَذَا (الثَّوْبَ) وَرَزَقَنِيهِ مِنْ غَيْرِ حَوْلٍ مِنِّي وَلَا قُوَّةٍ",
    translation:
        "Segala puji bagi Allah Yang telah memberikan pakaian ini kepadaku sebagai rezeki dari-pada-Nya tanpa daya dan kekuatan dari-ku.",
    reference: "Hadist Riwayat Bukhari, Muslim, Ibnu Majah, dan At-Tirmidzi",
  ),
  const DoaModel(
    title: "Do’a Masuk WC",
    arabic:
        "بِسْمِ اللَّهِ، اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْخُبُثِ وَالْخَبَائِثِ",
    translation:
        "Dengan nama Allah, ya Allah sesungguhnya aku berlindung kepada-Mu dari kejahatan setan laki-laki dan setan perempuan.",
    reference: "Hadits Riwayat Bukhari dan Muslim",
  ),
  const DoaModel(
    title: "Do’a Keluar WC",
    arabic:
        "غُفْرَانَكَ، الْحَمْدُ لِلَّهِ الَّذِي أَذْهَبَ عَنِّي الْأَذَى وَعَافَانِي",
    translation:
        "Aku memohon ampunan-Mu. Segala puji bagi Allah yang telah menghilangkan kotoran dari badanku dan yang telah menyehatkan diriku.",
    reference: "Hadits Riwayat Abu Dawud dan Ibnu Majah",
  ),
  const DoaModel(
    title: "Do’a Masuk Rumah",
    arabic:
        "بِسْمِ اللَّهِ وَلَجْنَا، وَبِسْمِ اللَّهِ خَرَجْنَا، وَعَلَى رَبِّنَا تَوَكَّلْنَا",
    translation:
        "Dengan menyebut nama Allah kami masuk, dan dengan menyebut nama Allah kami keluar, dan kepada Tuhan kami, kami bertawakal.",
    reference: "Hadits Riwayat Abu Dawud",
  ),
  const DoaModel(
    title: "Do’a Keluar",
    arabic:
        "بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ، لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ",
    translation:
        "Dengan nama Allah, aku bertawakal kepada Allah, tidak ada daya dan kekuatan kecuali dengan pertolongan Allah.",
    reference: "Hadits Riwayat Abu Dawud dan At-Tirmidzi",
  ),
];

// Data Doa Kategori Pagi & Malam
final List<DoaModel> listDoaPagiMalam = [
  const DoaModel(
    title: "Do’a Bangun Tidur",
    arabic:
        "اَلْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
    translation:
        "Segala puji bagi Allah yang menghidupkan kami kembali setelah mematikan kami dan kepada-Nya kami akan dibangkitkan.",
    reference: "Hadits Riwayat Bukhari dan Muslim",
  ),
  const DoaModel(
    title: "Do’a Sebelum Tidur",
    arabic: "بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا",
    translation: "Dengan nama-Mu ya Allah, aku mati dan aku hidup.",
    reference: "Hadits Riwayat Bukhari dan Muslim",
  ),
];

// Data Doa Kategori Makanan & Minuman
final List<DoaModel> listDoaMakananMinuman = [
  const DoaModel(
    title: "Do’a Sebelum Makan",
    arabic:
        "اللَّهُمَّ بَارِكْ لَنَا فِيمَا رَزَقْتَنَا وَقِنَا عَذَابَ النَّارِ، بِسْمِ اللَّهِ",
    translation:
        "Ya Allah, berkahilah kami dalam rezeki yang telah Engkau berikan kepada kami dan peliharalah kami dari siksa api neraka. Dengan nama Allah.",
    reference: "Hadits Riwayat Ibnu Sunni",
  ),
  const DoaModel(
    title: "Do’a Sesudah Makan",
    arabic:
        "الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مُسْلِمِينَ",
    translation:
        "Segala puji bagi Allah yang telah memberi makan dan minum kepada kami, serta menjadikan kami orang-orang muslim.",
    reference: "Hadits Riwayat Abu Dawud dan At-Tirmidzi",
  ),
];

// Data Doa Kategori Perjalanan
final List<DoaModel> listDoaPerjalanan = [
  const DoaModel(
    title: "Do’a Naik Kendaraan",
    arabic:
        "سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ",
    translation:
        "Maha Suci Tuhan yang telah menundukkan semua ini bagi kami padahal kami sebelumnya tidak mampu menguasainya, dan sesungguhnya kami akan kembali kepada Tuhan kami.",
    reference: "Hadits Riwayat Abu Dawud dan At-Tirmidzi",
  ),
];

// Data Doa Kategori Sholat
final List<DoaModel> listDoaSholat = [
  const DoaModel(
    title: "Do’a Iftitah",
    arabic:
        "اللَّهُمَّ بَاعِدْ بَيْنِي وَبَيْنَ خَطَايَايَ كَمَا بَاعَدْتَ بَيْنَ الْمَشْرِقِ وَالْمَغْرِبِ",
    translation:
        "Ya Allah, jauhkanlah antara diriku dan kesalahan-kesalahanku sebagaimana Engkau menjauhkan antara timur dan barat.",
    reference: "Hadits Riwayat Bukhari dan Muslim",
  ),
];

// Data Doa Kategori Etika Baik
final List<DoaModel> listDoaEtikaBaik = [
  const DoaModel(
    title: "Do’a Memohon Kebaikan Akhlak",
    arabic: "اللَّهُمَّ كَمَا حَسَّنْتَ خَلْقِي فَحَسِّنْ خُلُقِي",
    translation:
        "Ya Allah, sebagaimana Engkau telah memperbagus rupa penciptaanku, maka baguskanlah pula akhlak budi pekertiku.",
    reference: "Hadits Riwayat Ahmad",
  ),
];

// Daftar 6 Kategori Doa untuk DoaScreen
final List<DoaCategoryModel> listDoaCategories = [
  DoaCategoryModel(
    title: "Pagi & malam",
    icon: "assets/image/ic_doa_pagi_malam.png",
    doas: listDoaPagiMalam,
  ),
  DoaCategoryModel(
    title: "Rumah",
    icon: "assets/image/ic_doa_rumah.png",
    doas: listDoaRumah,
  ),
  DoaCategoryModel(
    title: "Makanan &\nMinuman",
    icon: "assets/image/ic_doa_makanan_minuman.png",
    doas: listDoaMakananMinuman,
  ),
  DoaCategoryModel(
    title: "Perjalanan",
    icon: "assets/image/ic_doa_perjalanan.png",
    doas: listDoaPerjalanan,
  ),
  DoaCategoryModel(
    title: "Sholat",
    icon: "assets/image/ic_doa_sholat.png",
    doas: listDoaSholat,
  ),
  DoaCategoryModel(
    title: "Etika Baik",
    icon: "assets/image/ic_doa_etika_baik.png",
    doas: listDoaEtikaBaik,
  ),
];

