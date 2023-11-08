import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/controller/double_tappable_interactive_controller.dart';

import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/home_screen/components/news_card.dart';

void main() {
  test('generate matrix for applyZoom test', () {
    //Create one Object of Controller
    var con = DoubleTappableInteractiveController();

    // comparing Matrices with app controller and mock methods output using same inputs
    expect(con.applyZoom(const Offset(2, 2), 4), applyZoomForTest(const Offset(2, 2), 4));
  });
  test('generate matrix for revertZoom test', () {
    //Create one Object of Controller
    var con = DoubleTappableInteractiveController();

    // comparing Matrices with app controller and mock methods output
    expect(con.revertZoom(), Matrix4.identity());
  });

  testWidgets('Title Text widget is render test', (WidgetTester tester) async {
    // Creating a mock data for testing
    var data = NewsData(
        title: "Proposal for double property tax on buildings without plan approval will hit MSMEs",
        imageUrl: "https://th-i.thgim.com/public/incoming/nv7cpb/article67509177.ece/alternates/LANDSCAPE_1200/MicrosoftTeams-image%20%282%29.png");
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: NewsCard(data: data)),
    ));

    // Verify that our Title Text widget is render properly.
    expect(find.text('Proposal for double property tax on buildings without plan approval will hit MSMEs'), findsOneWidget);
  });
}

//mock method for calculate matrix for apply zoom
Matrix4 applyZoomForTest(Offset localPosition, double scale) {
  final tapPosition = localPosition;
  final translationCorrection = scale - 1;
  final zoomed = Matrix4.identity()
    ..translate(
      -tapPosition.dx * translationCorrection,
      -tapPosition.dy * translationCorrection,
    )
    ..scale(scale);
  return zoomed;
}
