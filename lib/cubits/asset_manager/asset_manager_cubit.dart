import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_cubit/models/profile/profile.dart';

/// The AssetManagerCubit
class AssetManagerCubit extends Cubit<bool> {
  /// Create a new instance of [AssetManagerCubit].
  AssetManagerCubit() : super(false);

  int? _assetManagerId;

  /// Method used to perform the [updateProfile] action
  void updateProfile(Profile profile) {
    _assetManagerId = profile.assetManager;
    emit(_assetManagerId != null);
  }

  /// Method used to perform the [get] action
  int? get assetManagerId => _assetManagerId;
}

extension AssetManagerCubitExtension on BuildContext {
  /// Extension method used to get the [AssetManagerCubit] instance
  AssetManagerCubit get assetManagerCubit => read<AssetManagerCubit>();
}
