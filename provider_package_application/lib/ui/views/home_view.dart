import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/core/ViewModels/home_model.dart';
import 'package:provider_architecture/core/enums/ViewState.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider_architecture/ui/widgets/postlist_item.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getPost(1),
      builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: model.state == ViewState.busy
              ? Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    UIHelper.verticalSpaceLarge(),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Welcome ${Provider.of<User>(context).name}',
                        style: headerStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Here All your post',
                        style: subHeaderStyle,

                      ),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    Expanded(child: getPosyUi(model.post),)
                  ],
                )),
    );
  }

 Widget getPosyUi(List<Post> post) => ListView.builder(

      itemCount:  post.length,
     itemBuilder: (context,index) => PostListItem(
       post: post[index],
       onTap: (){

         Navigator.pushNamed(context, '/post',arguments: post[index]);


       },



     )

 );
}
