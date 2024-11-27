import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localizations/localizations.dart';
import 'package:photo_lab/src/application/shared/l10n_provider.dart';
import 'package:photo_lab/src/domain/photo/value_objects/filter_type.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}

extension LocalizedRef on Ref {
  AppLocalizations get loc => read(appLocalizationsProvider);
}

extension FilterTypeX on FilterType {
  String localizedName(BuildContext context) => switch (this) {
        FilterType.grayscale => AppLocalizations.of(context).grayscale,
        FilterType.sepia => AppLocalizations.of(context).sepia,
        FilterType.invert => AppLocalizations.of(context).invert,
      };
}
