import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:objectbox/objectbox.dart';

part 'tag_translate.g.dart';

@CopyWith()
@Entity()
class TagTranslate {
  TagTranslate({
    required this.namespace,
    required this.name,
    this.translateName,
    this.intro,
    this.links,
    this.lastUseTime = 0,
    this.id = 0,
  });

  @Id()
  int id;

  @Index()
  final String namespace;

  @Index()
  final String name;

  @Index()
  final String? translateName;
  final String? intro;
  final String? links;

  @Index()
  final int lastUseTime;

  /// Matches a Markdown image reference like `![alt](https://...)`.
  /// EhTagTranslation entries occasionally embed icons next to the
  /// translated text (e.g. `![](url) 胜利女神：妮姬`), and we only want
  /// the textual part to render in the UI.
  static final _markdownImageReg = RegExp(r'!\[[^\]]*\]\([^)]*\)');

  @Transient()
  String? get translateNameNotMD {
    final raw = translateName;
    if (raw == null) {
      return null;
    }
    final stripped = raw
        .replaceAll(_markdownImageReg, '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    return stripped.isEmpty ? raw : stripped;
  }

  @override
  String toString() {
    return 'TagTranslate{id: $id, namespace: $namespace, name: $name, translateName: $translateName, intro: $intro, links: $links, lastUseTime: $lastUseTime}';
  }
}
