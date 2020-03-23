

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_architecture/core/enums/ViewState.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';

import 'base_model.dart';


class LoginModel extends BaseModel{

  final AuthenticationService authenticationService = AuthenticationService();
  String errorMessage ;




Future<bool> login(String userId) async{

  setState(ViewState.busy);
  var  userid = int.parse(userId);

  var success = await authenticationService.login(userid);

  if(userid==null){
    errorMessage = "Value enterd is not a number";
    setState(ViewState.idle);
    return false;
  }

  setState(ViewState.idle);
  return success;

}


}