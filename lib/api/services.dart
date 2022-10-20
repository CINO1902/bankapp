import 'package:bankapp/linkfile/Models/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:bankapp/linkfile/networkhandler.dart';

abstract class user_detail{
  Future<List<UserModel>> getuserdetails();
}



class Userservices implements user_detail{
  @override
  Future<List<UserModel>> getuserdetails() async{
     var token = await networkHandler.getToken();     
      var response = await networkHandler.get('/user_details', token);
      List<UserModel> user = UserModelFromJson(response);
      return user;

  }

}