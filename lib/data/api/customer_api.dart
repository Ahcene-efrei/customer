import 'package:dio/dio.dart';
import 'package:customer/data/api/api.dart';
import 'package:customer/data/api/error_exception.dart';
import 'package:customer/data/models/address.dart';
import 'package:customer/data/models/appointment.dart';
import 'package:customer/data/models/customer.dart';

class CustomerApi extends Api{

  Future<dynamic> updateCustomer(Customer customer) async {
    final dio = Dio(BaseOptions(contentType: "application/json; charset=utf-8"));
    String token = await getJTWToken();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Bearer ${token}";
    var response = await dio.put('https://labonnecoupe.azurewebsites.net/api/Customer',
      data: {
        "firstname": customer.firstname,
        "lastname": customer.lastname,
        "email": customer.email,
        "pictureUrl": customer.pictureUrl,
        "gender": customer.gender,
        "hairType": customer.hairType
      },
    );

    if(response.statusCode == 200 && response.data['succeeded']) {
      return response.data;
    }else{
      throw ErrorException(
          succeeded: response.data['succeeded'],
          errorCode: response.data['errorCode'],
          message: response.data['message'],
          errors: response.data['errors']
      );
    }
  }

  Future<dynamic> addAddresse(Addresse addresse) async {
    final dio = Dio(BaseOptions(contentType: "application/json; charset=utf-8"));
    String token = await getJTWToken();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Bearer ${token}";
    var response = await dio.post('https://labonnecoupe.azurewebsites.net/api/address',
      data: {
        "name": addresse.name,
        "address1": addresse.address1,
        "address2": addresse.address2,
        "city": addresse.city,
        "country": addresse.country,
        "zipCode": addresse.zipCode,
        "latitude": addresse.latitude,
        "longitude": addresse.longitude,
      },
    );
    if(response.statusCode == 200 && response.data['succeeded']) {
      return response.data;
    }else{
      throw ErrorException(
          succeeded: response.data['succeeded'],
          errorCode: response.data['errorCode'],
          message: response.data['message'],
          errors: response.data['errors']
      );
    }

  }

  Future<dynamic> addAppointment(Appointment appointment) async {
    final dio = Dio(BaseOptions(contentType: "application/json; charset=utf-8"));
    String token = await getJTWToken();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Bearer ${token}";
    var response = await dio.post('https://labonnecoupe.azurewebsites.net/api/appointment',
      data: {
        "productId": appointment.product!.id,
        "timeSlotId": appointment.timeSlot!.id,
        "atHome": appointment.atHome
      },
    );

    if(response.statusCode == 200 && response.data['succeeded']) {
      return response.data;
    }else{
      throw ErrorException(
          succeeded: response.data['succeeded'],
          errorCode: response.data['errorCode'],
          message: response.data['message'],
          errors: response.data['errors']
      );
    }
  }

}