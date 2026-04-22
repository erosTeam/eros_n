import 'dart:io';
import 'dart:math';

import 'package:eros_n/store/db/entity/nh_tag.dart';
import 'package:eros_n/store/db/objectbox_helper.dart';
import 'package:flutter_test/flutter_test.dart';

Directory _tmpDir() {
  return Directory(
    '${Directory.systemTemp.path}/objectbox_test_${Random().nextInt(999999)}',
  );
}

void main() {
  late ObjectBoxHelper helper;
  late Directory dir;

  setUp(() async {
    dir = _tmpDir();
    dir.createSync(recursive: true);
    helper = ObjectBoxHelper();
    await helper.init(path: dir.path);
  });

  tearDown(() {
    helper.close();
    if (dir.existsSync()) {
      dir.deleteSync(recursive: true);
    }
  });

  group('NhTag CRUD', () {
    test('findNhTag returns null when store is empty', () {
      expect(helper.findNhTag(999), isNull);
    });

    test('putNhTag persists a tag and findNhTag retrieves it', () async {
      final tag = NhTag(id: 1, name: 'doujinshi', type: 'category', count: 100);
      await helper.putNhTag(tag);
      final found = helper.findNhTag(1);
      expect(found, isNotNull);
      expect(found!.name, 'doujinshi');
      expect(found.type, 'category');
    });

    test('putAllNhTag persists multiple tags', () async {
      final tags = List.generate(
        5,
        (i) => NhTag(id: i + 1, name: 'tag$i', type: 'parody'),
      );
      await helper.putAllNhTag(tags);
      final all = await helper.getAllNhTag();
      expect(all.length, 5);
    });

    test('getAllNhTag returns all stored tags', () async {
      await helper.putNhTag(NhTag(id: 10, name: 'alpha'));
      await helper.putNhTag(NhTag(id: 20, name: 'beta'));
      final all = await helper.getAllNhTag();
      expect(all.map((t) => t.id), containsAll([10, 20]));
    });

    test('findNhTagContains matches by name', () async {
      await helper.putNhTag(NhTag(id: 1, name: 'full color'));
      await helper.putNhTag(NhTag(id: 2, name: 'glasses'));
      final results = await helper.findNhTagContains('color', 10);
      expect(results.length, 1);
      expect(results.first.name, 'full color');
    });

    test('findNhTagContains matches by translateName', () async {
      await helper.putNhTag(NhTag(id: 3, name: 'glasses', translateName: '眼鏡'));
      await helper.putNhTag(
        NhTag(id: 4, name: 'school uniform', translateName: '制服'),
      );
      final results = await helper.findNhTagContains('眼', 10);
      expect(results.length, 1);
      expect(results.first.id, 3);
    });

    test('updateNhTagTime updates lastUseTime', () async {
      final before = DateTime.now().millisecondsSinceEpoch;
      await helper.putNhTag(NhTag(id: 5, name: 'test', lastUseTime: 0));
      await helper.updateNhTagTime(5);
      final updated = helper.findNhTag(5);
      expect(updated!.lastUseTime, greaterThanOrEqualTo(before));
    });

    test('updateNhTagTime is no-op for non-existent id', () async {
      await helper.updateNhTagTime(9999);
    });
  });
}
