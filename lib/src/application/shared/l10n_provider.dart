import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localizations/localizations.dart';

final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  ref.state = lookupAppLocalizations(
    basicLocaleListResolution(
      [WidgetsBinding.instance.platformDispatcher.locale],
      AppLocalizations.supportedLocales,
    ),
  );

  final observer = _LocaleObserver((locales) {
    ref.state = lookupAppLocalizations(
      basicLocaleListResolution(
        [WidgetsBinding.instance.platformDispatcher.locale],
        AppLocalizations.supportedLocales,
      ),
    );
  });
  final binding = WidgetsBinding.instance..addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
  return ref.state;
});

class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);

  final void Function(List<Locale>? locales) _didChangeLocales;

  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}
