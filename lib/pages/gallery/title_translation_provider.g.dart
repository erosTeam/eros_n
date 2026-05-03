// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_translation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TitleTranslationNotifier)
final titleTranslationProvider = TitleTranslationNotifierProvider._();

final class TitleTranslationNotifierProvider
    extends $NotifierProvider<TitleTranslationNotifier, int> {
  TitleTranslationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'titleTranslationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$titleTranslationNotifierHash();

  @$internal
  @override
  TitleTranslationNotifier create() => TitleTranslationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$titleTranslationNotifierHash() =>
    r'b346eac07bf179ef49657940be60ef0d6bbc7780';

abstract class _$TitleTranslationNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
