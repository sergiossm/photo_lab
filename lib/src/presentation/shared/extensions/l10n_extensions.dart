import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localizations/localizations.dart';
import 'package:photo_lab/src/application/shared/l10n_provider.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}

extension LocalizedRef on Ref {
  AppLocalizations get loc => read(appLocalizationsProvider);
}
