
class UserAvatarModel {
  final String userName;
  final String? imageUrl;
  final int numberOfUnreadMessage;
  final bool isOnline;
  UserAvatarModel({
    required this.isOnline,
    required this.numberOfUnreadMessage,
    required this.userName,
    this.imageUrl,
  });
}

final usersList = [
  UserAvatarModel(
    userName: 'Pin to favorite',
    numberOfUnreadMessage: 0,
    isOnline: false,
  ),
  UserAvatarModel(
    userName: 'Midala',
    imageUrl: 'assets/images/Frame 3293.png',
    numberOfUnreadMessage: 5,
    isOnline: true,
  ),
  UserAvatarModel(
    userName: 'Salsabila',
    imageUrl: 'assets/images/Frame 3293 (1).png',
    numberOfUnreadMessage: 0,
    isOnline: false,
  ),
  UserAvatarModel(
    userName: 'Midala',
    imageUrl: 'assets/images/Frame 3293 (2).png',
    numberOfUnreadMessage: 0,
    isOnline: false,
  ),
  UserAvatarModel(
    userName: 'Midala',
    imageUrl: 'assets/images/Frame 3293 (3).png',
    numberOfUnreadMessage: 0,
    isOnline: false,
  ),
  UserAvatarModel(
    userName: 'Midala',
    imageUrl: 'assets/images/Frame 3293 (4).png',
    numberOfUnreadMessage: 0,
    isOnline: false,
  ),
  UserAvatarModel(
    userName: 'Midala',
    imageUrl: 'assets/images/Frame 3293 (1).png',
    numberOfUnreadMessage: 0,
    isOnline: false,
  ),
];
