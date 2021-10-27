class Hairdresser {
   String? phoneNumber;
   String firstname;
   String? lastname;
   String? email;
   String? pictureUrl;
   int? commandCount;
   int? status;
   int? gender;
   List<dynamic>? addresses;
  final List<dynamic>? appointments;
  final List<dynamic>? planning;
  final List<dynamic>? catalog;
  final String? siretNumber;
  final String? productId;

  Hairdresser({
    this.phoneNumber,
    required this.firstname,
    this.lastname,
    this.email,
    this.pictureUrl,
    this.commandCount,
    this.status,
    this.gender,
    this.addresses,
    this.appointments,
    this.planning,
    this.catalog,
    this.siretNumber,
    this.productId
  });

  void fromJson(jsonData){
    this.phoneNumber = jsonData["phoneNumber"];
    this.firstname = jsonData["firstname"];
    this.lastname = jsonData["lastname"];
    this.email = jsonData["email"];
    this.pictureUrl = jsonData["pictureUrl"];
    this.gender = jsonData["gender"];
    this.addresses = jsonData["addresses"];
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'pictureUrl': pictureUrl,
      'gender': gender,
      'addresses': addresses,
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