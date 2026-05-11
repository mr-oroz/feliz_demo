import 'dart:convert';

class Token {
  final String token;

  const Token({
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) => Token.fromMap(json.decode(source));
}