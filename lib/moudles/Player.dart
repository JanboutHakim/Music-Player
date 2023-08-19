import 'package:music_player/moudles/Song.dart';

class Player {
  //songs list
  static List<Song> songs = [
    Song(
        imagepath: 'images/gym.jpg',
        title: 'Gym Monster',
        subtitle: 'Hero singer'),
    Song(imagepath: 'images/apart.jpg', title: 'Apart', subtitle: 'Somone'),
    Song(
        imagepath: 'images/beliver.jpg',
        title: 'Beliver',
        subtitle: 'Imagine Dragons'),
    Song(
        imagepath: 'images/origins.jpg',
        title: 'Origins',
        subtitle: 'Imagine Dragons'),
    Song(imagepath: 'images/hope.jpg', title: 'Hope', subtitle: 'Hope'),
    Song(imagepath: 'images/apart.jpg', title: 'Apart', subtitle: 'Somone'),
    Song(
        imagepath: 'images/beliver.jpg',
        title: 'Beliver',
        subtitle: 'Imagine Dragons'),
    Song(
        imagepath: 'images/origins.jpg',
        title: 'Origins',
        subtitle: 'Imagine Dragons'),
    Song(imagepath: 'images/hope.jpg', title: 'Hope', subtitle: 'Hope'),
  ];

  List<String> imagepaths = [
    'images/apart.jpg',
    'images/beliver.jpg'
        'images/origins.jpg'
        'images/hope.jpg'
  ];
}

// get the image main color
