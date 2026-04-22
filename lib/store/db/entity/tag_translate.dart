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

  @Transient()
  String? get translateNameNotMD {
    final reg = RegExp(r'!\[(\S+)?\]\(.+?\)(\S+)');
    final match = reg.allMatches(translateName ?? '');
    if (match.isNotEmpty) {
      return translateName?.replaceAllMapped(
            reg,
            (match) => match.group(2) ?? '',
          ) ??
          translateName;
    } else {
      return translateName;
    }
  }

  @override
  String toString() {
    return 'TagTranslate{id: $id, namespace: $namespace, name: $name, translateName: $translateName, intro: $intro, links: $links, lastUseTime: $lastUseTime}';
  }
}
