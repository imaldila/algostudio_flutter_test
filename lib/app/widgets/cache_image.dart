import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/cache_manager.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheManager: customCacheManager,
      key: UniqueKey(),
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.grey,
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.image_not_supported_sharp),
      ),
    );
  }
}
