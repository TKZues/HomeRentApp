
import 'package:flutter_application_1/src/repositories/itemblog_repositories.dart';
import 'package:flutter_application_1/src/service/itemblog_services.dart';
import 'package:flutter_application_1/utils/services/dio_option.dart';
import 'package:provider/provider.dart';

/// A Calculator.
class AppCCVC {
  static List initProvider() {
    final client = DioOption().createDio();
    return [
           ChangeNotifierProvider<ItemBlogRepositories>(create: (context) => ItemBlogRepositories(ItemBlogService(client)),),
          
    ];
  }
}
