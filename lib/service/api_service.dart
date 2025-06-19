import 'package:dio/dio.dart';
import 'package:shopfee_app/service/api_constants.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  // Check user existed
  static Future<dynamic> checkUserExisted( String phoneNumber) async {
    try {
      final response = await _dio.post(
        checkUserExistedUrl,
        queryParameters: {
          'phoneNumber': phoneNumber,
        },
      );

       if (response.statusCode == 200) {
        final data = response.data;
        final bool result = data['result'];

        if (result == true) {
          final String? pinCode = data['pinCode'];
          return {
            'result': true,
            'pinCode': pinCode,
          };
        } else {
          return {
            'result': false,
            'pinCode': null,
          };
        }
      } else {
        print("API error: ${response.statusCode}");
      }
    } catch (e) {
      print('checkUserExisted error: $e');
      rethrow;
    }
  }

  // Register user
  static Future<bool> registerUser(String name, String phoneNumber, String pinCode) async {
    try {
      final response = await _dio.post(
        registerUserUrl,
        queryParameters: {
          'name': name,
          'phoneNumber': phoneNumber,
          'pinCode': pinCode,
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to register user');
      }
    } catch (e) {
      print('registerUser error: $e');
      rethrow;
    }
  }

//send OTP
  static Future<String> sendOtp(String phoneNumber) async {
    try {
      final response = await _dio.post(
        sendOtpUrl,
        queryParameters: {
          'phoneNumber': phoneNumber,
        },
      );

      if (response.statusCode == 200) {
        return response.data['otp'];
      } else {
        throw Exception('Failed to send OTP');
      }
    } catch (e) {
      print('sendOtp error: $e');
      rethrow;
    }
  }


//get all produccts
static Future<List<dynamic>> getAllProducts() async {
    try {
      final response = await _dio.get(getAllProductsUrl);

      if (response.statusCode == 200) {
        print(response.data);
        return response.data as List<dynamic>;
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      print('getAllProducts error: $e');
      rethrow;
    }
  }

}
