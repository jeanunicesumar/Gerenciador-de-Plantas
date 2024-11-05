import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciador_planta/components/titulo_grafico.dart';

void main() {
  testWidgets('TituloGrafico display', (WidgetTester tester) async {
    const String testTitle = 'Test Title';
    const String testLegend = 'Test Legend';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TituloGrafico(testTitle, testLegend),
        ),
      ),
    );

    expect(find.text(testTitle), findsOneWidget);
    expect(find.text(testLegend), findsOneWidget);

    final titleText = tester.widget<Text>(find.text(testTitle));
    expect(titleText.style?.color, const Color.fromARGB(200, 231, 193, 243));
    expect(titleText.style?.fontSize, 16);

    final legendText = tester.widget<Text>(find.text(testLegend));
    expect(legendText.style?.color, const Color.fromARGB(200, 231, 193, 243));
    expect(legendText.style?.fontSize, 12);
  });
}
