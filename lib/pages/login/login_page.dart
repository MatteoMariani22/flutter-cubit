import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_essentials_kit/flutter_essentials_kit.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:flutter_cubit/cubits/asset_manager/asset_manager_cubit.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  ...

  const LoginPage({
    super.key,
    ...
  });

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => ...
          ),
          BlocProvider<ConfigurationBloc>(
            create: (context) => ...
          ),
          BlocProvider<BiometryBloc>(
            create: (context) => ...
          ),
        ],
        child: this,
      );
}

class _LoginPageState extends State<LoginPage> {
  ...

  ...

  final _form = FormGroup({
    ...
  });

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ...
    });

    if (...) {
      context.profileBloc.reset();

      _showDialogUnauthenticated(context);
    }
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
        listeners: [
          BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) => switch (state) {
              SigningInAuthenticationState() => _form.markAsDisabled(),
              SignedInAuthenticationState() => _onSignedIn(context),
              ErrorSigningInAuthenticationState(:final error) => _onSignInError(context, error),
              GotCredentialAuthenticationState(:final credential) =>
                _setCredential(context, credential),
              _ => null,
            },
          ),
          BlocListener<BiometryBloc, BiometryState>(
            listener: (context, state) => switch (state) {
              AuthenticatedBiometryState() => _onSignIn(context, true),
              NotAuthenticatedBiometryState() => _showBiometryRetryDialog(context),
              ErrorAuthenticatingBiometryState() => _showBiometryRetryDialog(context),
              _ => null,
            },
          ),
          BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) => switch (state) {
              GotProfileState(:final profile) => _goToHomePage(context, profile),
              ErrorGettingProfileState(:final error) => _onProfileError(context, error),
              NotAuthorizedProfileState() => _onProfileNotAuthorizedError(context),
              _ => null,
            },
          ),
        ],
        child: PopScope(
          canPop: false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              ...
            ),
          ),
        ),
      );

  void _showDialog(BuildContext context, bool available, BiometryToggle toggle) async {
    ...
  }

  void _showBiometryDialog(BuildContext ctx) {
    ...
  }

  void _onSignIn(BuildContext ctx, bool biometricSecurity) {
    ...
  }

  void _setCredential(BuildContext context, Credential credential) async {
    ...
  }

  void _onSignedIn(BuildContext context) {
    ...
  }

  void _goToHomePage(BuildContext context, Profile profile) async {
    context.read<AssetManagerCubit>().updateProfile(profile);

    ...
  }

  void _onSignInError(
    BuildContext context,
    LocalizedError? error,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ...
    });

    _form.markAsEnabled();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ...
    });
  }

  void _showBiometryRetryDialog(BuildContext context) {
    ...
  }

  void _resetPassword(BuildContext context) {
    ...
  }

  void _onProfileNotAuthorizedError(BuildContext context) async {
    ...
  }

  void _onProfileError(BuildContext context, LocalizedError error) {
    ...
  }

  void _showDialogUnauthenticated(BuildContext context) {
    ...
  }
}
