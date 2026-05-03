// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_translation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CommentTranslationNotifier)
final commentTranslationProvider = CommentTranslationNotifierProvider._();

final class CommentTranslationNotifierProvider
    extends $NotifierProvider<CommentTranslationNotifier, Map<int, String>> {
  CommentTranslationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentTranslationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentTranslationNotifierHash();

  @$internal
  @override
  CommentTranslationNotifier create() => CommentTranslationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, String>>(value),
    );
  }
}

String _$commentTranslationNotifierHash() =>
    r'31fdce8fb3538ca9f507b9147a18565ee2a46f9c';

abstract class _$CommentTranslationNotifier
    extends $Notifier<Map<int, String>> {
  Map<int, String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Map<int, String>, Map<int, String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<int, String>, Map<int, String>>,
              Map<int, String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
