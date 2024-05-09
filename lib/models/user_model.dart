class User {

  final int worker_id;
  final String firstName;
  final String lastName;
  final String email;
  final String token;

  User({
    required this.worker_id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.token,
  });

  // Метод для сериализации данных пользователя в JSON
  Map<String, dynamic> toJson() {
    return {
      'worker_id': worker_id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'token': token,
    };
  }

  // Фабричный метод для создания экземпляра User из JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      worker_id: json['worker_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      token: json['token'],
    );
  }

}


