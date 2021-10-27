class User {
  final int hairType;
  final String phoneNumber;
  final String firstname;
  final String lastname;
  final String email;
  final String pictureUrl;
  final int commandCount;
  final int status;
  final int gender;
  final List<dynamic> addresses;

  User({
    required this.hairType,
    required this.phoneNumber,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.pictureUrl,
    required this.commandCount,
    required this.status,
    required this.gender,
    required this.addresses
  });

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'pictureUrl': pictureUrl,
      'gender': gender,
      'addresses': addresses,
      'hairType' : hairType
    };
  }

  bool isRegistered(){
    return (phoneNumber != ''
        && firstname != ''
        && lastname != ''
        && email != ''
    );
  }


}