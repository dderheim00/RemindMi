class Task {
  int userId;
  String img;
  String title;
  bool isCheck;

  Task(
      {required this.userId,
      required this.img,
      required this.title,
      required this.isCheck});

  static List<Task> tasks = [
    Task(
        userId: 1,
        img: 'assets/images/android_img.png',
        title: "Android",
        isCheck: true),
    Task(
        userId: 2,
        img: 'assets/images/flutter.jpeg',
        title: "Flutter",
        isCheck: false),
    Task(
        userId: 3,
        img: 'assets/images/ios_img.webp',
        title: "IOS",
        isCheck: false),
    Task(
        userId: 4,
        img: 'assets/images/php_img.png',
        title: "PHP",
        isCheck: false),
    Task(
        userId: 5,
        img: 'assets/images/node_img.png',
        title: "Node",
        isCheck: false),
  ];
}
