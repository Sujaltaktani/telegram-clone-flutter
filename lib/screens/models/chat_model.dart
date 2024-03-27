class ChatModel {
  final String name;
  final String message;
  final String time;
  final String imgPath;
  final bool status;
  final int? messNum; // Make messNum nullable

  ChatModel({
    required this.name, // Use required for mandatory fields
    required this.message,
    required this.time,
    required this.imgPath,
    required this.status,
    this.messNum, // Remove required for messNum
  });
}

final List<ChatModel> items = [
  ChatModel(
    name: 'Black Hat Bot',
    message: 'repellat earum qui',
    time: '10:39',
    imgPath: 'assets/images/img1.jpg',
    status: true,
    messNum: 2000,
  ),
  ChatModel(
    name: 'Linux Master Bot',
    message: 'esse minus reiciendis',
    time: 'Feb 12',
    imgPath: 'assets/images/img2.jpg',
    status: false,
    messNum: 420,
  ),
  ChatModel(
    name: 'Joker Bot ',
    message: 'suscipit molestias rerum',
    time: '12:12',
    imgPath: 'assets/images/img3.jpg',
    status: false,
    messNum: 20,
  ),
  ChatModel(
    name: 'Personal Bot ',
    message: 'quam perferendis ratione',
    time: '6:11',
    imgPath: 'assets/images/img4.jpg',
    status: true,
  ),
  ChatModel(
    name: 'Python Bot',
    message: 'blanditiis expedita distinctio',
    time: 'Jan 1',
    imgPath: 'assets/images/img5.jpg',
    status: true,
    messNum: 50,
  ),
  ChatModel(
    name: 'Bot 3',
    message: 'dolorum dolore at',
    time: '4:00',
    imgPath: 'assets/images/img6.jpg',
    status: true,
    messNum: 104,
  ),
  ChatModel(
    name: 'Personal Assistant Bot',
    message: 'ut sunt sequi',
    time: 'Dec 10',
    imgPath: 'assets/images/img7.jpg',
    status: false,
    messNum: 249,
  ),
  ChatModel(
    name: 'Random Bot 1',
    message: 'dolorem quisquam dolorem',
    time: '4:30',
    imgPath: 'assets/images/img8.jpg',
    status: false,
  ),
  ChatModel(
    name: 'Random Bot 2',
    message: 'et laborum mollitia',
    time: '6:00',
    imgPath: 'assets/images/img9.jpg',
    status: true,
    messNum: 3000,
  ),
];
