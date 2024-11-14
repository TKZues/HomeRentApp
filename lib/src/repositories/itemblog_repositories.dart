import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/src/model/itemblogmodel.dart';
import 'package:flutter_application_1/src/service/itemblog_services.dart';
import 'package:flutter_application_1/utils/repository/base.dart';
import 'package:flutter_application_1/utils/snackbar/snackbar_util.dart';

class ItemBlogRepositories extends BaseRepository<ItemBlogService> {
  ItemBlogRepositories(super.service);

  String _title = "";
  String get title => _title;

  String _body = "";
  String get body => _body;

  final List<BlogModel> _blogList = [];
  List<BlogModel> get blogList => _blogList;

  Future<void> getblog() async {
    startLoading();
    try {
      final res = await service.getblog();
      if (res.statusCode != 200) {
        _blogList.clear();
        finishLoading();
        return;
      }
      if (res.statusCode == 200) {
        _blogList.clear();
        for (final item in res.data) {
          final blog = BlogModel.fromJson(item);
          _blogList.add(blog);
        }
      } else {
        _blogList.clear();
        CustomSnackbar.snackbarError(res.data['message']);
      }
      finishLoading();
    } on DioError catch (error) {
      _blogList.clear();
      _error(error.message.toString());
    } catch (error) {
      _blogList.clear();
      _error(error.toString());
    }
  }

  Future<void> getblogdetail({required int index}) async {
    startLoading();
    try {
      final res = await service.getblogdetail(index: index);
      if (res.statusCode != 200) {
        finishLoading();
        return;
      }
      if (res.statusCode == 200) {
        _title = res.data['title'];
        _body = res.data['body'];
      } else {
        CustomSnackbar.snackbarError(res.data['message']);
      }
      finishLoading();
    } on DioError catch (error) {
      _error(error.message.toString());
    } catch (error) {
      _blogList.clear();
      _error(error.toString());
    }
  }

  _error(String message) {
    finishLoading();
    errorMessage = message.toString();
    if (message.isNotEmpty) {
      CustomSnackbar.snackbarError(message);
    }
  }
}
