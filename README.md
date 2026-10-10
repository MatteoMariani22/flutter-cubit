# flutter-cubit

A compact Flutter snippet demonstrating a typical Cubit implementation with
`flutter_bloc`. 

The [`AssetManagerCubit`](lib/cubits/asset_manager/asset_manager_cubit.dart)
uses a boolean state, initializes it to `false`, and emits an updated value when
a profile is provided. It also retains the profile's asset manager ID and
exposes a `BuildContext` extension for accessing the Cubit with `read`.
