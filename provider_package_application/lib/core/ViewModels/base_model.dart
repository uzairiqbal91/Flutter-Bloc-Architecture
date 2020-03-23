import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/enums/ViewState.dart';

import 'login_model.dart';




class BaseModel extends ChangeNotifier{

  // all the state related code should be in BaseModel class
  ViewState viewState = ViewState.idle;

  ViewState get state => viewState;

  void setState(ViewState viewState){

    this.viewState=viewState;
    notifyListeners();

  }


}