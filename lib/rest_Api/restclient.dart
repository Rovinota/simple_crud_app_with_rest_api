import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_crud_app_with_rest_api/style/style.dart';


Future<bool> ProductCreateRequest (Formvalues) async {
  var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody = json.encode(Formvalues);
  var PostHeader = {
    "Content-Type" : "application/json"
  };
  var Responce = await http.post(URL, headers: PostHeader, body: PostBody);
  var Resultcode = Responce.statusCode;
  var ResultBody = json.decode(Responce.body);

  if (Resultcode == 200 && ResultBody['status'] == 'success') {
      SuccessToast("Request Successfull");
      return true;
  }
  else {
      errorToast("Request Fail!! Try Again!");
  return false;
  }



}