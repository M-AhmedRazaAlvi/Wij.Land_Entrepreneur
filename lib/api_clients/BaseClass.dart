import '../providers/GlobalProvider/navigation/navigation_provider.dart';
import '../utils/controller.dart';

String baseURL = "https://$gloal_base_path/api";
dynamic header = {
  "Authorization": "Bearer ${authController.myUser.value.token!}",
  "Content-type": "application/json"
};

