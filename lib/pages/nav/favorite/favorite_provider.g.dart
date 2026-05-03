// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoriteGallerys)
final favoriteGallerysProvider = FavoriteGallerysProvider._();

final class FavoriteGallerysProvider
    extends $NotifierProvider<FavoriteGallerys, List<Gallery>> {
  FavoriteGallerysProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteGallerysProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteGallerysHash();

  @$internal
  @override
  FavoriteGallerys create() => FavoriteGallerys();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Gallery> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Gallery>>(value),
    );
  }
}

String _$favoriteGallerysHash() => r'e01ade81130c88affe1227c8933cdaf09442d285';

abstract class _$FavoriteGallerys extends $Notifier<List<Gallery>> {
  List<Gallery> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Gallery>, List<Gallery>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Gallery>, List<Gallery>>,
              List<Gallery>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(FavoriteNotifier)
final favoriteProvider = FavoriteNotifierProvider._();

final class FavoriteNotifierProvider
    extends $NotifierProvider<FavoriteNotifier, ListViewState> {
  FavoriteNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoriteProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoriteNotifierHash();

  @$internal
  @override
  FavoriteNotifier create() => FavoriteNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListViewState>(value),
    );
  }
}

String _$favoriteNotifierHash() => r'd2d6846a60262211b5fc87d72e86910e9ce90859';

abstract class _$FavoriteNotifier extends $Notifier<ListViewState> {
  ListViewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ListViewState, ListViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ListViewState, ListViewState>,
              ListViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
