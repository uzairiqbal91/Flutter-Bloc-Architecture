import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/ViewModels/login_model.dart';
import 'package:provider_architecture/core/enums/ViewState.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController textEditingController  = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // because change notifier and consumer in all view that is why need to make base_view

    return BaseView<LoginModel>(

        builder: (context,model,child)=> Scaffold(

          backgroundColor: backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginHeader(
                controller: textEditingController ,
              validationMessage: model.errorMessage,
              ),
              model.state == ViewState.idle ?  RaisedButton(

                child:
               Text(
                  'Login',
                  style: TextStyle(color: Colors.black),

                ),
                onPressed: () async {


                  var loginsusscess = await model.login(textEditingController.text);
                  if(loginsusscess){
                    // Navigate to home screen
                    Navigator.pushNamed(context, '/');
                  }



                },

              ) : CircularProgressIndicator()


            ],
          ),



        ),



    );
  }
}
