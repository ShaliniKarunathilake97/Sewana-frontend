// ignore_for_file: file_names

import 'package:sewana/posts/post.dart';
import 'package:sewana/users/user.dart';

List<Post> postList = [
  Post(
      user: User(
          userName: "Thushari Perera",
          contactInfo: "0812345678",
          imgUrl:
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
      caption:
          "Beautiful kitten for adoption in Kandy.Contact the owner for more details 0778424211",
      timeAgo: "5m",
      likes: 3,
      comments: 1,
      shares: 2,
      imgUrls: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQei1txUdPM1nTFudU0RgNbbEOrDS_ZYqH2qiWy7DMMNRqQUAbZkjUMEe930hWOLMKZKlI&usqp=CAU",
        "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3V0ZSUyMGNhdHxlbnwwfHwwfHw%3D&w=1000&q=80",
        "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3V0ZSUyMGNhdHxlbnwwfHwwfHw%3D&w=1000&q=80",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQei1txUdPM1nTFudU0RgNbbEOrDS_ZYqH2qiWy7DMMNRqQUAbZkjUMEe930hWOLMKZKlI&usqp=CAU"
      ]),
  Post(
      user: User(
          userName: "Devon Ranasinghe",
          contactInfo: "devon@gmail.com",
          imgUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR63KoribGVDB_dswx8iUX99udIebJK_EsaYYTwg2vJoIeIECXhO8iWnI5VBU64wLJ-8gg&usqp=CAU"),
      caption: "4 months old kitten in Colombo",
      timeAgo: "45m",
      likes: 30,
      comments: 10,
      shares: 12,
      imgUrls: [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQei1txUdPM1nTFudU0RgNbbEOrDS_ZYqH2qiWy7DMMNRqQUAbZkjUMEe930hWOLMKZKlI&usqp=CAU",
        "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3V0ZSUyMGNhdHxlbnwwfHwwfHw%3D&w=1000&q=80",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQei1txUdPM1nTFudU0RgNbbEOrDS_ZYqH2qiWy7DMMNRqQUAbZkjUMEe930hWOLMKZKlI&usqp=CAU",
        "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3V0ZSUyMGNhdHxlbnwwfHwwfHw%3D&w=1000&q=80",
      ])
];
