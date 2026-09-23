import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_cubit/cubits/asset_manager/asset_manager_cubit.dart';

@RoutePage()
class MainPage extends StatelessWidget implements AutoRouteWrapper {
  const MainPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<...>(
            create: (context) => ...
          ),
          BlocProvider<...>(
            create: (context) => ...
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    final isAssetManager = context.assetManagerCubit.state;

    return BlocListener<PlaybackBloc, PlaybackState>(
      listener: (context, state) => switch (state) {
        GotPlaybackState(:final playback) => _getPlaylist(playback, context),
        _ => null,
      },
      child: AuthHandler(
        child: AutoTabsRouter.pageView(
          ...
        ),
      ),
    );
  }

  void _onBottomNavigationItemSelected(BuildContext context, int index) {
    ...
  }

  void _getPlaylist(
    Playback playback,
    BuildContext context,
  ) {
    ...
  }

  List<PageRouteInfo> _getRoutes(BuildContext context, bool isAssetManager) {
    return [
      ...
    ];
  }
}
