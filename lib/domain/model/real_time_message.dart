class RealTimeMessage {
  final String message;
  final int senderId;
  final int id;

  RealTimeMessage({required this.message, required this.senderId, required this.id});

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'senderId': senderId,
      'id': id,
    };
  }

  factory RealTimeMessage.fromJson(Map<String, dynamic> json) {
    return RealTimeMessage(
      message: json['message'],
      senderId: json['senderId'],
      id: json['id'],
    );
  }
}
