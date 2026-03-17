import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mind_arena/main.dart';

void main() {
  testWidgets('App loads test', (WidgetTester tester) async {

    // ❌ const hata diya (FIX)
    await tester.pumpWidget(MindArenaApp());

    // ✅ Simple test (app load ho raha hai ya nahi)
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}