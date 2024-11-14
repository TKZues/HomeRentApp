import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/repositories/itemblog_repositories.dart';
import 'package:flutter_application_1/src/screen/profile/post_widget.dart';
import 'package:flutter_application_1/src/screen/profile/profiledetail.dart/profiledetail.dart';
import 'package:flutter_application_1/src/service/itemblog_services.dart';
import 'package:flutter_application_1/utils/provider/provider_base.dart';
import 'package:flutter_application_1/utils/services/dio_option.dart';
import 'package:flutter_application_1/utils/text/textcustom.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import 'package:provider/provider.dart';

import '../../../../../utils/config/size_config.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});
  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final repo = context.read<ItemBlogRepositories>();
      repo.getblog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: context.read<ItemBlogRepositories>(),
        child: ProgressHUD(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(title: TextCustom(
              text: "Blog",
              color: Colors.black,
              fontSize: psHeight(16),
            ),),
            body: ConsumerBase<ItemBlogRepositories>(
              onRepository: (repository) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      GridView.builder(
                          itemCount: repository.blogList.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            crossAxisSpacing: psHeight(1),
                            mainAxisSpacing: psHeight(1),
                            mainAxisExtent: psHeight(400),
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                final client = DioOption().createDio();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChangeNotifierProvider(
                                      create: (_) =>
                                          ItemBlogRepositories(ItemBlogService(client)),
                                      child: ProfileDetail(index: repository.blogList[index].id??0),
                                    ),
                                  ),
                                );
                              },
                              child: PostWidget(
                                index: index,
                                repository: repository.blogList[index],
                              ),
                            );
                          }),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
