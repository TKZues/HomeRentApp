// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/src/repositories/itemblog_repositories.dart';
import 'package:flutter_application_1/utils/config/size_config.dart';
import 'package:flutter_application_1/utils/provider/provider_base.dart';
import 'package:flutter_application_1/utils/text/textcustom.dart';

// ignore: must_be_immutable
class ProfileDetail extends StatefulWidget {
  final int index;
  const ProfileDetail({super.key, required this.index});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final repo = context.read<ItemBlogRepositories>();
      repo.getblogdetail(index: widget.index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: context.read<ItemBlogRepositories>(),
      child: ProgressHUD(
        child: Scaffold(
          appBar: AppBar(title: TextCustom(
              text: "Thông tin Blog",
              color: Colors.black,
              fontSize: psHeight(16),
            ),),
          body: ConsumerBase<ItemBlogRepositories>(
            onRepository: (repository) {
              return  Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Image.network(
                    "https://www.realestate.com.au/news-image/w_2500,h_1667/v1728023270/news-lifestyle-content-assets/wp-content/production/metricon-winner.jpeg?_i=AA",
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.comment_outlined)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.bookmark_outline)),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(
                      repository.title,
                        maxLines: 1,
                        style: TextStyle(
                      fontSize: psHeight(16),
                      fontWeight: FontWeight.bold
                    ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                    
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            repository.body,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'See more',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.grey.shade400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'See 20 comments',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey.shade400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
                )
              ],
            );
            },
            
          ),
        ),
      ),
    );
  }
}
