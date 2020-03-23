import 'package:provider_architecture/core/ViewModels/base_model.dart';
import 'package:provider_architecture/core/enums/ViewState.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/locator.dart';

class HomeModel extends BaseModel{

  Api api = locator<Api>();

  List<Post> post;


  Future getPost(int userId) async {

     setState(ViewState.busy);
     post = await api.getPostsForUser(userId);
     setState(ViewState.idle);


  }






}