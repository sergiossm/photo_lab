import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_lab/src/presentation/authentication/authentication_form_type.dart';

class AuthenticationPage extends HookConsumerWidget {
  const AuthenticationPage({
    required AuthenticationFormType formType,
    super.key,
  }) : _formType = formType;

  final AuthenticationFormType _formType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formType = useState(_formType);
    final signUpStep = useState(0);
    final reverseSignUpAnimation = useState(false);
    final signInStep = useState(0);
    final reverseSignInAnimation = useState(false);

    return PopScope(
      canPop: signUpStep.value == 0 && signInStep.value == 0,
      onPopInvokedWithResult: (didPop, result) {
        reverseSignUpAnimation.value = true;
        signUpStep.value = 0;

        reverseSignInAnimation.value = true;
        signInStep.value = 0;
      },
      child: const Scaffold(),
    );
  }
}
