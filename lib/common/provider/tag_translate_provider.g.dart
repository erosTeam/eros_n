// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_translate_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TagTranslateNotifier)
final tagTranslateProvider = TagTranslateNotifierProvider._();

final class TagTranslateNotifierProvider
    extends $NotifierProvider<TagTranslateNotifier, TagTranslateInfo> {
  TagTranslateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagTranslateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagTranslateNotifierHash();

  @$internal
  @override
  TagTranslateNotifier create() => TagTranslateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TagTranslateInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TagTranslateInfo>(value),
    );
  }
}

String _$tagTranslateNotifierHash() =>
    r'0bccd9aa6faf29ea7e35154a12d6aa2c93d8e298';

abstract class _$TagTranslateNotifier extends $Notifier<TagTranslateInfo> {
  TagTranslateInfo build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<TagTranslateInfo, TagTranslateInfo>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TagTranslateInfo, TagTranslateInfo>,
              TagTranslateInfo,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(allNhTag)
final allNhTagProvider = AllNhTagProvider._();

final class AllNhTagProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<NhTag>>,
          List<NhTag>,
          FutureOr<List<NhTag>>
        >
    with $FutureModifier<List<NhTag>>, $FutureProvider<List<NhTag>> {
  AllNhTagProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allNhTagProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allNhTagHash();

  @$internal
  @override
  $FutureProviderElement<List<NhTag>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<NhTag>> create(Ref ref) {
    return allNhTag(ref);
  }
}

String _$allNhTagHash() => r'c450ab5b1c3345761057b23c0927d06e4096b96d';
