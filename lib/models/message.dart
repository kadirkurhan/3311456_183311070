class MessageDTO {
  final String title;
  final String message;

  const MessageDTO({
    required this.title,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'message': message,
    };
  }
}
