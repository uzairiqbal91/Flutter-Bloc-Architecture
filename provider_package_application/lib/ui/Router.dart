import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/ui/views/home_view.dart';
import 'package:provider_architecture/ui/views/login_view.dart';
import 'package:provider_architecture/ui/views/post_view.dart';

class Router {
  static Route<dynamic> generaeRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        //asasasasas
        return MaterialPageRoute(builder: (_) => HomeView());

      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());

      case '/post':


        var posts = settings.arguments as Post;



        return MaterialPageRoute(builder: (_) => PostView(post: posts,));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route found ${settings.name}'),
                  ),
                ));
    }
  }
}
