import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/main.dart'; // Importa la clase principal de la aplicación

void main() {
  // Define una prueba de widgets llamada 'Timer start, stop, and reset test'
  testWidgets('Timer start, stop, and reset test', (WidgetTester tester) async {
    // Carga el widget principal de la aplicación (TimerScreen) en el tester.
    await tester.pumpWidget(MaterialApp(
      home: TimerScreen(),
    ));

    // Verificar que el cronómetro comienza en 0:00:00
    expect(find.text('Tiempo: 00:00:00'), findsOneWidget);

    // Tocar el botón "Iniciar" y esperar 1 segundo
    await tester.tap(find.text('Iniciar'));
    await tester.pump(const Duration(seconds: 1));

    // Verificar que el cronómetro ha avanzado
    expect(find.text('Tiempo: 00:00:01'), findsOneWidget);

    // Tocar el botón "Detener" y esperar 1 segundo
    await tester.tap(find.text('Detener'));
    await tester.pump(const Duration(seconds: 1));

    // Verificar que el cronómetro se ha detenido
    expect(find.text('Tiempo: 00:00:01'), findsOneWidget);

    // Tocar el botón "Reiniciar" y esperar 1 segundo
    await tester.tap(find.text('Reiniciar'));
    await tester.pump(const Duration(seconds: 1));

    // Verificar que el cronómetro ha vuelto a 0:00:00
    expect(find.text('Tiempo: 00:00:00'), findsOneWidget);
  });
}
