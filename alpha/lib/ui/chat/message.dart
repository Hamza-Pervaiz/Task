class Message {
  final String content;
  final bool isUserMessage;
  String? imagepath;
  String? filepath;

  Message(
      {required this.content,
      required this.isUserMessage,
      this.imagepath,
      this.filepath});
}
