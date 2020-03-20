class HomeEvents{}

class FetchData extends HomeEvents{


  bool isError = false;
      bool hasData = true;

      FetchData({this.isError = false , this.hasData = true});
  
}
