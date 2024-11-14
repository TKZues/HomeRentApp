import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/model/itemblogmodel.dart';
import 'package:flutter_application_1/utils/config/size_config.dart';

// ignore: must_be_immutable
class PostWidget extends StatelessWidget {
  int index;
  BlogModel repository;
  PostWidget({
    super.key,
    required this.index,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
              repository.title ?? "",
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
                    repository.body ?? "",
                    maxLines: 4,
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
  }
}
