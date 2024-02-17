class LibraryViewModel {
  String image;
  String title;
  String subtitle;
  bool? pinned;

  LibraryViewModel({
    required this.image,
    required this.title,
    required this.subtitle,
    this.pinned,
  });
}

List<LibraryViewModel> libraryItems = [
  LibraryViewModel(
    image: "https://misc.scdn.co/liked-songs/liked-songs-300.png",
    title: "Liked Songs",
    subtitle: "Playlist • 662 songs",
    pinned: true,
  ),
  LibraryViewModel(
    image: "https://i.scdn.co/image/ab67706c0000da848409bf1af3b92282304aae7a",
    title: "Japanese soft and chill music 🌱",
    subtitle: "Playlist • Galaxiaa♡",
  ),
  LibraryViewModel(
    image:
        "https://mosaic.scdn.co/300/ab67616d00001e022794743c6eb13addc2b01420ab67616d00001e024b062591b6a5c15652dd2bb5ab67616d00001e02684d81c9356531f2a456b1c1ab67616d00001e02de2d1cf763ed06e6874e1e91",
    title: "Japanese Songs",
    subtitle: "Playlist • Rem",
  ),
  LibraryViewModel(
    image: "https://i.scdn.co/image/ab67706c0000da84c9fe2e0df0e9873550b8eb6f",
    title: "8D Music 2024 🎧 8D Audio | 8D Songs by 8D Tunes",
    subtitle: "Playlist • 8D TUNES",
  ),
  LibraryViewModel(
    image: "https://i.scdn.co/image/ab67706c0000da84ac22df3d16713456bfdc3e50",
    title: "Japanese Piano Music",
    subtitle: "Playlist • Piano Peace",
  ),
  LibraryViewModel(
    image: "https://i.scdn.co/image/ab67706c0000da84511a478e2c8302cd93fcfe16",
    title: "Nice Songs",
    subtitle: "Playlist • Rem",
  ),
  LibraryViewModel(
    image:
        "https://mosaic.scdn.co/300/ab67616d00001e020c13d3d5a503c84fcc60ae94ab67616d00001e026d7c02467c47de371bceb59eab67616d00001e028265a736a1eb838ad5a0b921ab67616d00001e028863bc11d2aa12b54f5aeb36",
    title: "My recommendation playlist",
    subtitle: "Playlist • Rem",
  ),
  LibraryViewModel(
      image: "https://misc.scdn.co/your-episodes/SE-64.png",
      title: "Your Episodes",
      subtitle: "Saved and downloaded episodes"),
  LibraryViewModel(
    image:
        "https://www.billboard.com/wp-content/uploads/2020/04/eminem-press-photo-2019-aqu-billboard-1548-1587659998.jpg",
    title: "Eminem",
    subtitle: "Artist",
  ),
  LibraryViewModel(
    image: "https://i.scdn.co/image/ab67706c0000da84f269723fdbf41b54ce449567",
    title:
        "Bokuyaba: Boku no Kokoro no Yabai Yatsu Season 2 「 (僕は...) & (恋してる自分すら愛せるんだ) 」 僕の心のヤバイやつ  (OP/ED)",
    subtitle: "Bokuyaba: The Sangers in My Heart",
  ),
];
