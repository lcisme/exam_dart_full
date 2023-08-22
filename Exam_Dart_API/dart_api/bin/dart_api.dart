import 'package:dart_api/Customer.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
void main(List<String> arguments) {

  getAllCustomer();

  var customer = Customer(
    fullName: 'string',
    birthDay: '2003-03-09',
    address: 'string',
    phoneNumber: 'string',
  );

  createCustomer(customer);

}

void getAllCustomer() async {
  var url = Uri.parse('http://localhost:8080/customers');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    List<Customer> customerListt = [];

    for (var json in jsonResponse) {
      Customer customer = Customer.fromJson(json);
      customerListt.add(customer);
    }
    print('-------------------------------------------------');
    for (var customer in customerListt) {
      print('Id nhân viên:        ${customer.id}');
      print('Họ và tên Nhân viên: ${customer.fullName}');
      print('Ngày sinh Nhân viên: ${customer.birthDay}');
      print('Địa chỉ Nhân viên:   ${customer.address}');
      print('Số điện Thoại Nhân viên: ${customer.phoneNumber}');
      print('-------------------------------------------------');
    }
  } else {
    print('Fail: ${response.statusCode}');
  }
}

void createCustomer(Customer customer) async {
  var url = Uri.parse('http://localhost:8080/customers');
  var customerJson = jsonEncode(customer.toJson());

  var response = await http.post(url, body: customerJson, headers: {
    'Content-Type': 'application/json',
  });

  if (response.statusCode == 200) {
    print('Success');
  } else {
    print('Fail: ${response.statusCode}');
  }
}
