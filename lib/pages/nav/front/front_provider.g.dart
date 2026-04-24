// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'front_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GallerysNotifier)
final gallerysProvider = GallerysNotifierProvider._();

final class GallerysNotifierProvider
    extends $NotifierProvider<GallerysNotifier, List<Gallery>> {
  GallerysNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gallerysProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gallerysNotifierHash();

  @$internal
  @override
  GallerysNotifier create() => GallerysNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Gallery> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Gallery>>(value),
    );
  }
}

String _$gallerysNotifierHash() => r'f49b3dbcd4f35041694be525ba7955d740670a57';

abstract class _$GallerysNotifier extends $Notifier<List<Gallery>> {
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

@ProviderFor(PopularNotifier)
final popularProvider = PopularNotifierProvider._();

final class PopularNotifierProvider
    extends $NotifierProvider<PopularNotifier, List<Gallery>> {
  PopularNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'popularProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$popularNotifierHash();

  @$internal
  @override
  PopularNotifier create() => PopularNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Gallery> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Gallery>>(value),
    );
  }
}

String _$popularNotifierHash() => r'1b9fa0dcf2a6e401648733944b1a6e5ad13aa1f2';

abstract class _$PopularNotifier extends $Notifier<List<Gallery>> {
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

@ProviderFor(FrontNotifier)
final frontProvider = FrontNotifierProvider._();

final class FrontNotifierProvider
    extends $NotifierProvider<FrontNotifier, ListViewState> {
  FrontNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'frontProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$frontNotifierHash();

  @$internal
  @override
  FrontNotifier create() => FrontNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListViewState>(value),
    );
  }
}

String _$frontNotifierHash() => r'4a3c2d597f38bfa64d565903378fc5aa335725f7';

abstract class _$FrontNotifier extends $Notifier<ListViewState> {
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
