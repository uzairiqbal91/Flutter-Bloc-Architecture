import 'dart:async';

import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/locator.dart';

class AuthenticationService {



  Api api = locator<Api>();
  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userid) async {
    var fetchedUser = await api.getUserProfile(userid);
    userController.add(fetchedUser);

    var hasUser = fetchedUser != null;

    if(hasUser){
//      print("usrname is 1 " + fetchedUser.name);


    }
    
    return hasUser;
  }
}
