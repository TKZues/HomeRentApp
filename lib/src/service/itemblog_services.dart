
import 'package:dio/dio.dart';
import 'package:flutter_application_1/utils/services/base.dart';


class ItemBlogService extends BaseService {
  // ignore: use_super_parameters
  ItemBlogService(Dio client) : super(client);


    Future<Response> getblog() async {
    return client.get("https://jsonplaceholder.typicode.com/posts",);

    
  }

  Future<Response> getblogdetail({required int index}) async {
    return client.get("https://jsonplaceholder.typicode.com/posts/$index",);

    
  }
}

