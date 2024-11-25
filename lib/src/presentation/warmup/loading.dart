part of 'app_warmup_widget.dart';

class _Loading extends ConsumerWidget {
  const _Loading();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: LoadingIndicator(),
        ),
      ),
    );
  }
}
