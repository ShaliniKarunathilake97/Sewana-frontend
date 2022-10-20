class User {
  String userName = "";
  String imgUrl = "";
  String contactInfo = "";
  String? public_id = "";

  User(
      {required this.userName,
      required this.imgUrl,
      this.public_id,
      required this.contactInfo});
}
