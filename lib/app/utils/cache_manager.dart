import 'package:flutter_cache_manager/flutter_cache_manager.dart';

final customCacheManager = CacheManager(
  Config(
    'customCachekey',
    stalePeriod: const Duration(days: 30),
    maxNrOfCacheObjects: 100,
  ),
);
