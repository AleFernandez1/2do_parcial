// Importa las bibliotecas necesarias para el proyecto
import 'dart:async'; // Para trabajar con temporizadores y programación asíncrona
import 'package:flutter/material.dart'; // Para la interfaz de usuario de Flutter
import 'package:intl/intl.dart'; // Para dar formato a fechas y horas

void main() {
  // Función principal que inicia la aplicación Flutter
  runApp(
      const TimerApp()); // Llama a la función runApp() para iniciar la aplicación y pasa una instancia de TimerApp
}

class TimerApp extends StatelessWidget {
  const TimerApp({Key? key});

// Método build que construye la interfaz de usuario de la aplicación
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronómetro Flutter', // Título de la aplicación
      home:
          SplashScreen(), // Widget principal que se mostrará al inicio de la aplicación
    );
  }
}

class SplashScreen extends StatefulWidget {
  // Clase SplashScreen que hereda de StatefulWidget (widget con estado)
  @override // Método que crea el estado para el widget
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Clase que representa el estado de SplashScreen
  @override // Método que se llama cuando se inicializa el estado
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      // Navega a la nueva pantalla "Settings" después de 5 segundos
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        // Navega a la nueva pantalla "OptionsScreen" después de 5 segundos
        builder: (context) => OptionsScreen(),
      ));
    });
  }

  @override // Método que construye la interfaz de usuario de SplashScreen
  Widget build(BuildContext context) {
    // Retorna un Scaffold que contiene un contenedor con una imagen y un texto centrados
    return Scaffold(
      body: Container(
        color: Colors.lightGreenAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                // Muestra una imagen desde una URL
                'https://cdn.icon-icons.com/icons2/620/PNG/512/stopwatch-tool_icon-icons.com_56755.png',
                width: 250.0,
                height: 250.0,
              ),
              SizedBox(height: 20),
              // Muestra un texto con estilo
              Text(
                'Timing App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retorna un Scaffold que contiene una barra de aplicación, un fondo y una columna de botones
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu de Inicio'),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Muestra una imagen desde una URL
            Image.network(
              'https://cdn.icon-icons.com/icons2/1790/PNG/512/homepage1_114609.png',
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              // Crea un botón elevado que navega a la pantalla TimerScreen al hacer clic
              onPressed: () {
                // Navega a la pantalla del cronómetro al hacer clic en el botón
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimerScreen(),
                ));
              },
              child: Text('Ir al Cronómetro'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // Crea un botón elevado que navega a la pantalla DateTimeScreen al hacer clic
              onPressed: () {
                // Navega a la pantalla de Fecha y Hora al hacer clic en el botón
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DateTimeScreen(),
                ));
              },
              child: Text('Ir a Fecha y Hora'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              // Crea un botón elevado que navega a la pantalla CalendarScreen al hacer clic
              onPressed: () {
                // Navega a la pantalla de Fecha y Hora al hacer clic en el botón
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AlarmsScreen(),
                ));
              },
              child: Text('Ir al Calendario'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Clase TimerScreen que hereda de StatefulWidget (widget con estado)
class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}); // Constructor constante de la clase
// Método que crea el estado para el widget
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

// Clase _TimerScreenState que hereda de State (estado mutable del widget)
class _TimerScreenState extends State<TimerScreen> {
  int _minutes = 0; // Variable para almacenar minutos
  int _seconds = 0; // Variable para almacenar segundos
  int _centiseconds = 0; // Variable para almacenar centisegundos
  bool _isActive =
      false; // Variable para controlar si el temporizador está activo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Devuelve un Scaffold, que es un marco estructural para la interfaz de usuario
      appBar: AppBar(
        // Barra de aplicación con un título y fondo de color azul claro
        title: Text('Cronómetro Flutter'), // Texto del título
        backgroundColor:
            Colors.lightBlue, // Color de fondo de la barra de aplicación
      ),
      backgroundColor: Colors.lightGreenAccent,
      // Cuerpo del Scaffold, que contiene el contenido principal de la pantalla
      body: Center(
        // Centro de la pantalla
        child: Column(
          // Columna de elementos secundarios alineados en el centro verticalmente
          mainAxisAlignment:
              MainAxisAlignment.center, // Alineación principal al centro
          children: <Widget>[
            Image.network(
              // Imagen de red con URL específica y dimensiones definidas
              'https://cdn.icon-icons.com/icons2/1306/PNG/512/chronometer_86154.png',
              width: 200.0, // Ancho de la imagen
              height: 200.0, // Alto de la imagen
            ),
            SizedBox(height: 20), // Espacio en blanco vertical de 20 unidades
            // Texto que muestra el tiempo en formato mm:ss:cc
            Text(
              'Tiempo: ${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}:${_centiseconds.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20), // Espacio en blanco vertical de 20 unidades
            // Botón elevado que inicia o detiene el temporizador
            ElevatedButton(
              onPressed: () {
                if (!_isActive) {
                  startTimer(); // Inicia el temporizador si no está activo
                } else {
                  stopTimer(); // Detiene el temporizador si está activo
                }
              },
              child: Text(_isActive
                  ? 'Detener'
                  : 'Iniciar'), // Texto del botón según el estado del temporizador
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Colors.lightBlue), // Color de fondo del botón
              ),
            ),
            SizedBox(height: 20), // Espacio en blanco vertical de 20 unidades
            ElevatedButton(
              // Botón elevado que reinicia el temporizador
              onPressed: () {
                resetTimer(); // Reinicia el temporizador
              },
              child: Text('Reiniciar'), // Texto del botón
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Colors.lightBlue), // Color de fondo del botón
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    // Método que inicia el temporizador y actualiza el estado de la pantalla
    setState(() {
      _isActive = true; // Establece el temporizador como activo
    });

    Timer.periodic(Duration(milliseconds: 10), (timer) {
      // Timer periódico que actualiza el tiempo cada 10 milisegundos
      if (!_isActive) {
        timer.cancel(); // Cancela el temporizador si ya no está activo
        return;
      }
      setState(() {
        if (_centiseconds < 99) {
          _centiseconds++; // Incrementa los centisegundos
        } else {
          _centiseconds = 0;
          if (_seconds < 59) {
            _seconds++; // Incrementa los segundos y reinicia los centisegundos
          } else {
            _seconds = 0;
            _minutes++; // Incrementa los minutos y reinicia los segundos
          }
        }
      });
    });
  }

  void stopTimer() {
    // Método que detiene el temporizador y actualiza el estado de la pantalla
    setState(() {
      _isActive = false; // Establece el temporizador como inactivo
    });
  }

// Método que reinicia el temporizador y actualiza el estado de la pantalla
  void resetTimer() {
    setState(() {
      _minutes = 0;
      _seconds = 0;
      _centiseconds = 0; // Reinicia los minutos, segundos y centisegundos
      _isActive = false; // Establece el temporizador como inactivo
    });
  }
}

class DateTimeScreen extends StatefulWidget {
  @override
  _DateTimeScreenState createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  String _formattedDateTime = '';

  @override
  void initState() {
    super.initState();
    _updateDateTime();
  }

  void _updateDateTime() {
    // Método privado para actualizar la fecha y hora cada segundo
    final now = DateTime.now().toLocal(); // Obtener la fecha y hora local
    final formatter =
        DateFormat('dd/MM/yyyy HH:mm:ss'); // Formato de fecha y hora
    final formattedDateTime = formatter.format(now);

    setState(() {
      _formattedDateTime =
          formattedDateTime; // Actualiza el estado con la nueva fecha y hora
    });

    // Actualiza la fecha y hora cada segundo
    Timer(Duration(seconds: 1), _updateDateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Devuelve un Scaffold, que es un contenedor visual básico de la aplicación.
      appBar: AppBar(
        // Barra de aplicación con un título y un color de fondo.
        title: Text('Fecha y Hora'),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors
          .lightGreenAccent, // Fondo del cuerpo de la aplicación con un color claro.
      body: Center(
        // Cuerpo de la aplicación, centrado verticalmente.
        child: Column(
          // Columna que contiene varios widgets uno debajo del otro.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              // Widget Image que muestra una imagen desde una URL de internet.
              'https://cdn.icon-icons.com/icons2/620/PNG/512/calendar-with-a-clock-time-tools_icon-icons.com_56831.png',
              width: 250.0,
              height: 250.0,
            ),
            SizedBox(height: 20),
            Text(
              // Texto que muestra información relacionada con la fecha y la hora.
              'Fecha y Hora de Argentina:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              // Texto que muestra la fecha y la hora formateadas.
              _formattedDateTime,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class AlarmsScreen extends StatefulWidget {
  @override
  _AlarmsScreenState createState() => _AlarmsScreenState();
}

class _AlarmsScreenState extends State<AlarmsScreen> {
  // Lista de URLs de imágenes de Internet
  List<String> imageUrls = [
    'https://media.istockphoto.com/id/1367912857/es/vector/calendario-de-enero-de-2023-imprimible-plantilla-de-calendario-2023-dise%C3%B1o-de-planificador.jpg?s=612x612&w=0&k=20&c=RZyB98OzloJ18KIK-HKTo0HvNfUoInRFf-IahpeByC4=',
    'https://media.istockphoto.com/id/1367912859/es/vector/calendario-de-febrero-de-2023-imprimible-plantilla-de-calendario-2023-dise%C3%B1o-de-planificador.jpg?s=612x612&w=0&k=20&c=UlxDGXuG4IYnL19ZmdbdqcFQ9W7JvHtFziGdtlOu0NM=',
    'https://media.istockphoto.com/id/1367912878/es/vector/calendario-de-marzo-de-2023-imprimible-plantilla-de-calendario-2023-dise%C3%B1o-de-planificador.jpg?s=612x612&w=0&k=20&c=3HGPU7b_KdmB0XuB7VOlKN-ryJnhN3_v5JdHU6MLTj4=',
    'https://media.istockphoto.com/id/1367912877/es/vector/calendario-de-abril-de-2023-imprimible-plantilla-de-calendario-2023-dise%C3%B1o-de-planificador.jpg?s=612x612&w=0&k=20&c=wUDW7_l8L0i5hbDkSep5jtlfKWaze2xcbiFhiV-wVgc=',
    'https://media.istockphoto.com/id/1367912914/es/vector/calendario-de-mayo-de-2023-imprimible-plantilla-de-calendario-2023-dise%C3%B1o-de-planificador.jpg?s=612x612&w=0&k=20&c=C1NL7s1d2vlOkqv8I9P9cEz5_iwoNyLIENKPd_vEC38=',
    'https://media.istockphoto.com/id/1367912884/es/vector/calendario-de-junio-de-2023-imprimible-plantilla-de-calendario-2023-dise%C3%B1o-de-planificador.jpg?s=612x612&w=0&k=20&c=hz9TaY5TM4xsA-PrMpObICWSpauyxeGa24-8P47JxCU=',
    'https://media.istockphoto.com/id/1367912928/es/vector/calendario-de-julio-de-2023-imprimible-plantilla-de-calendario-2023-dise%C3%B1o-de-planificador.jpg?s=612x612&w=0&k=20&c=rkBJ7yXJZFkBgIVei9OmY_dSuyPRb5ada73GO6tkgT8=',
    'https://media.istockphoto.com/id/1367912922/es/vector/calendario-de-agosto-de-2023-imprimible-plantilla-de-calendario-2023-dise%C3%B1o-de-planificador.jpg?s=612x612&w=0&k=20&c=biWBmafWJedAbpZDCHeiaZ5dN52KYs_1jecSLFknchQ=',
    'https://media.istockphoto.com/id/1367912950/es/vector/calendario-imprimible-de-septiembre-de-2023-plantilla-de-calendario-2023-dise%C3%B1o-de.jpg?s=612x612&w=0&k=20&c=dwIcyGEossgjukY72X5OYHG_wck8PTtLQlwaSpMNk-Q=',
    'https://media.istockphoto.com/id/1367912965/es/vector/calendario-de-octubre-de-2023-imprimible-plantilla-de-calendario-2023-dise%C3%B1o-de-planificador.jpg?s=612x612&w=0&k=20&c=ZTPfDSzoEpQJwNNHVuGajehevB-TtAInyCRisl9IT-w=',
    'https://media.istockphoto.com/id/1367912971/es/vector/calendario-imprimible-de-noviembre-de-2023-plantilla-de-calendario-2023-dise%C3%B1o-de.jpg?s=612x612&w=0&k=20&c=ev7uQonob2fHzdMw6wTrbQN9S1UErw4G9KbX8P5vSOo=',
    'https://media.istockphoto.com/id/1367912973/es/vector/calendario-de-diciembre-de-2023-imprimible-plantilla-de-calendario-2023-dise%C3%B1o-de.jpg?s=612x612&w=0&k=20&c=NJ9IyEQyH6t1Jd0cTbPPdhF2YqttYbdbIgiXngsgC5U=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Barra de aplicación con un título y un color de fondo.
        title: Text('Calendario'),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.lightGreenAccent,
      body: ListView.builder(
        // Cuerpo de la aplicación, un ListView.builder que genera imágenes desde una lista de URLs.
        itemCount: imageUrls
            .length, // La cantidad de elementos en la lista es igual a la longitud de la lista de URLs de imágenes.
        itemBuilder: (context, index) {
          // Función de generación de elementos en el ListView.
          return Padding(
            // Cada elemento es un contenedor con relleno que contiene una imagen desde una URL.
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              imageUrls[index], // URL de la imagen actual.
              loadingBuilder: (BuildContext context,
                  Widget
                      child, // Constructor de carga que maneja el progreso de carga de la imagen.
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  // Si la carga ha terminado, devuelve la imagen.
                  return child;
                } else {
                  // Si la carga está en progreso, muestra un indicador de progreso.
                  return Center(
                    child: CircularProgressIndicator(
                      // Calcula el progreso de carga.
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              // Constructor de error que muestra un ícono de error si la carga falla.
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Icon(Icons.error);
              },
            ),
          );
        },
      ),
    );
  }
}
