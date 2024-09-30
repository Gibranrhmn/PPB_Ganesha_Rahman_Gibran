// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laprak02/main.dart'; 

void main() {
  testWidgets('Profile Page displays correct information', (WidgetTester tester) async {
  
    await tester.pumpWidget(MaterialApp(home: ProfilePage()));


    expect(find.text('Profil'), findsOneWidget);


    expect(find.text('Ganesha Rahman Gibran'), findsOneWidget);


    expect(find.text('2211104058'), findsOneWidget);


    expect(find.text('gibranworkspace@gmail.com'), findsOneWidget);


    expect(find.text('Pekalongan, 11 Oktober 2003'), findsOneWidget);


    expect(find.text('Purwokerto'), findsOneWidget);


    expect(find.byIcon(Icons.account_box), findsOneWidget);
    expect(find.byIcon(Icons.email), findsOneWidget);
    expect(find.byIcon(Icons.cake), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
  });
}

