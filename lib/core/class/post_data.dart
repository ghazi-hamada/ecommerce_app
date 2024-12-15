import 'crud.dart';

class PostData {
  Crud crud;
  PostData(this.crud);

  postData({
    required String linkurl,
    required Map data,
  }) async {
    var response = await crud.postData(linkurl, data);
    return response.fold((l) => l, (r) => r);
  }
}
