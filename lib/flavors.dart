import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Application flavors for various environments
enum Flavor {
  /// Staging environment flavor
  staging('staging'),

  /// Development environment flavor
  development('development'),

  ///Production environment flavor
  production('production');

  const Flavor(this.name);

  final String name;
}

/// Global function to return the current flavor
/// Always returns Flavor.prod on Flutter web release builds
Flavor getFlavor() {
  if (kIsWeb && kReleaseMode) {
    return Flavor.production; // --flavor is not supported on web
  }
  return switch (appFlavor) {
    'prod' => Flavor.production,
    'stg' => Flavor.staging,
    'dev' => Flavor.development,
    null => Flavor.development, // * if not specified, default to dev
    _ => throw UnsupportedError('Invalid flavor: $appFlavor'),
  };
}
