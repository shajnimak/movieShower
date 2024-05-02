// lib/widgets/custom_list_tile.dart
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';
import '../models/news_item.dart';

class CustomListTileNews extends StatelessWidget {
  final NewsItem newsItem;
  final VoidCallback onTap;

  const CustomListTileNews({
    super.key,
    required this.newsItem,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Hero(
              tag: 'actor-image-${newsItem.id}',
              child: CachedNetworkImage(
                imageUrl: newsItem.imageUrl,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      newsItem.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      newsItem.body,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
