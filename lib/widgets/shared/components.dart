import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/webview_screen.dart';

Widget defaultBuldArticlItems(article, context) => InkWell(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WebViewScreen(url: article['url']);
      })),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: article['urlToImage'] != null
                  ? Image.network(
                      article['urlToImage'],
                    )
                  : Image.network(
                      "https://cdni.rt.com/media/pics/2021.12/original/61a7819242360404114efda4.png"),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article['title'],
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    article['publishedAt'].toString(),
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
