// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GalleryNotifier)
final galleryProvider = GalleryNotifierFamily._();

final class GalleryNotifierProvider
    extends $NotifierProvider<GalleryNotifier, Gallery> {
  GalleryNotifierProvider._({
    required GalleryNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'galleryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$galleryNotifierHash();

  @override
  String toString() {
    return r'galleryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GalleryNotifier create() => GalleryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Gallery value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Gallery>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GalleryNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$galleryNotifierHash() => r'f326929ea235d7f09e00df291c9b7cb491e909fe';

final class GalleryNotifierFamily extends $Family
    with $ClassFamilyOverride<GalleryNotifier, Gallery, Gallery, Gallery, int> {
  GalleryNotifierFamily._()
    : super(
        retry: null,
        name: r'galleryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GalleryNotifierProvider call(int gid) =>
      GalleryNotifierProvider._(argument: gid, from: this);

  @override
  String toString() => r'galleryProvider';
}

abstract class _$GalleryNotifier extends $Notifier<Gallery> {
  late final _$args = ref.$arg as int;
  int get gid => _$args;

  Gallery build(int gid);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Gallery, Gallery>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Gallery, Gallery>,
              Gallery,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(PageState)
final pageStateProvider = PageStateFamily._();

final class PageStateProvider
    extends $NotifierProvider<PageState, GalleryViewState> {
  PageStateProvider._({
    required PageStateFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'pageStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pageStateHash();

  @override
  String toString() {
    return r'pageStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PageState create() => PageState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GalleryViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GalleryViewState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PageStateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pageStateHash() => r'c736854bdaf20e4df9ed6e30dbfc2888fd71ba83';

final class PageStateFamily extends $Family
    with
        $ClassFamilyOverride<
          PageState,
          GalleryViewState,
          GalleryViewState,
          GalleryViewState,
          int
        > {
  PageStateFamily._()
    : super(
        retry: null,
        name: r'pageStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PageStateProvider call(int gid) =>
      PageStateProvider._(argument: gid, from: this);

  @override
  String toString() => r'pageStateProvider';
}

abstract class _$PageState extends $Notifier<GalleryViewState> {
  late final _$args = ref.$arg as int;
  int get gid => _$args;

  GalleryViewState build(int gid);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<GalleryViewState, GalleryViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GalleryViewState, GalleryViewState>,
              GalleryViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(ThumbHeroTagPrefix)
final thumbHeroTagPrefixProvider = ThumbHeroTagPrefixProvider._();

final class ThumbHeroTagPrefixProvider
    extends $NotifierProvider<ThumbHeroTagPrefix, String> {
  ThumbHeroTagPrefixProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'thumbHeroTagPrefixProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$thumbHeroTagPrefixHash();

  @$internal
  @override
  ThumbHeroTagPrefix create() => ThumbHeroTagPrefix();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$thumbHeroTagPrefixHash() =>
    r'9d067620721bcac6a5e6f9f13fc2ad8636692525';

abstract class _$ThumbHeroTagPrefix extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
