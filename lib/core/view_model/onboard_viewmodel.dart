class OnbordingContent {
  String image;
  String title;
  String description;

  OnbordingContent(
      {required this.image, required this.title, required this.description});
}

List<OnbordingContent> contents = [
  OnbordingContent(
      title: 'Podkes',
      image: 'assets/images/podkes_logo.png',
      description:
          "A podcast is an episodic series of spoken word digital audio files that a user can download to a personal device for easy listening."),
  OnbordingContent(
      title: 'Discover Music',
      image: 'assets/images/podkes_logo.png',
      description:
          "Explore and discover new music from a vast library of artists, albums, and genres."),
  OnbordingContent(
      title: 'Create Playlists',
      image: 'assets/images/podkes_logo.png',
      description:
          "Organize your favorite tracks into playlists and enjoy them anytime, anywhere."),
];
