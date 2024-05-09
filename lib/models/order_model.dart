class Order {
  final int id;
  final Client client;
  final String dateOrder;
  final ClientEquipment clientEquipment;
  final TypeService typeService;
  final String? problemDescription;

  Order({
    required this.id,
    required this.client,
    required this.dateOrder,
    required this.clientEquipment,
    required this.typeService,
    required this.problemDescription,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      client: Client.fromJson(json['client']),
      dateOrder: json['DateOrder'],
      clientEquipment: ClientEquipment.fromJson(json['clientEquipment']),
      typeService: TypeService.fromJson(json['typeService']),
      problemDescription: json['problemDescription'],
    );
  }
}

class Client {
  final int id;
  final String firstName;
  final String lastName;
  final String address;
  final String phone;

  Client({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.phone,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      address: json['Address'],
      phone: json['Phone'],
    );
  }
}

class ClientEquipment {
  final String type;
  final String name;
  final String company;

  ClientEquipment({
    required this.type,
    required this.name,
    required this.company,
  });

  factory ClientEquipment.fromJson(Map<String, dynamic> json) {
    return ClientEquipment(
      type: json['type'],
      name: json['Name'],
      company: json['Company'],
    );
  }
}

class TypeService {
  final String name;

  TypeService({
    required this.name,
  });

  factory TypeService.fromJson(Map<String, dynamic> json) {
    return TypeService(
      name: json['name'],
    );
  }
}