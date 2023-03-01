import 'package:get_storage/get_storage.dart';

const baseURL = "https://ln-ref.herokuapp.com:443/api";
final box = GetStorage();

var header = {
  "Authorization": "Bearer ${box.read('token')}",
  "Content-type": "application/json",
};
