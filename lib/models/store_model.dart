class Store {
  late int id;
  late String address;
  late double latitude;
  late double longitude;
  late String phone;
  late String time;

  // Конструктор по умолчанию
  Store();

  // Метод для преобразования экземпляра класса в Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'phone': phone,
      'time': time,
    };
  }

  // Фабричный метод для создания экземпляра класса из Map (JSON)
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store()
      ..id = json['id'] as int
      ..address = json['address'] as String
      ..latitude = json['latitude'] as double
      ..longitude = json['longitude'] as double
      ..phone = json['phone'] as String
      ..time = json['time'] as String;
  }
}