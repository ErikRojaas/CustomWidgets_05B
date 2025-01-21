import 'package:custom_widgets/layout_dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_desktop_kit/cdk.dart';

class LayoutProgress extends StatefulWidget {
  const LayoutProgress({super.key});

  @override
  State<LayoutProgress> createState() => _LayoutProgressState();
}

class _LayoutProgressState extends State<LayoutProgress> with TickerProviderStateMixin {
  // Variables para la barra de progreso estática
  double _progressL = 0.0;
  // Variables para la barra de progreso indeterminada animada
  bool _isRunningL = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  // Variables para el círculo de progreso estático
  double _progressC = 0.0;
  bool _isRunningC = false;

  // Variables para el círculo de progreso indeterminado
  late AnimationController _circularController;
  late Animation<double> _circularAnimation;

  // Método para incrementar la barra de progreso estática
  void _increaseProgressL() {
    setState(() {
      _progressL = (_progressL + 0.1);
      if (_progressL > 1) {
        _progressL = 0.0;
      }
    });
  }

  // Método para alternar la animación de la barra indeterminada
  void _toggleIndeterminateL() {
    setState(() {
      if (_isRunningL) {
        _controller.stop();
      } else {
        _controller.repeat();
      }
      _isRunningL = !_isRunningL;
    });
  }

  // Método para alternar la animación del círculo de progreso indeterminado
  void _toggleIndeterminateC() {
    setState(() {
      if (_isRunningC) {
        _circularController.stop();
      } else {
        _circularController.repeat();
      }
      _isRunningC = !_isRunningC;
    });
  }

  @override
  void initState() {
    super.initState();
  
    // Configuración del controlador de animación para la barra indeterminada
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    // Configuración del controlador para el círculo indeterminado
    _circularController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _circularAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _circularController, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _circularController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const SizedBox(height: 4),
    
      // Barra de progreso estática
      const Padding(padding: EdgeInsets.all(8), child: Text('CDKProgressBar:', style: TextStyle(fontFamily: 'MS_Sans_Serif', fontSize: 23))),
      Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 250,
                height: 27,
                child: CustomPaint(
                  painter: WindowsXPBarPainter(_progressL),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                _progressL.toStringAsFixed(1),
                style: const TextStyle(fontSize: 20, fontFamily: 'MS_Sans_Serif'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: CDKButtonWindowsXP(
                onPressed: _increaseProgressL,
                child: const Text('Increase', style: TextStyle(fontFamily: 'MS_Sans_Serif', fontSize: 18)),
              ),
            ),
          ]
      ),
    
      const SizedBox(height: 35),


      // Barra de progreso indeterminada animada
      const Padding(padding: EdgeInsets.all(8), child: Text('CDKProgressBar (Indeterminate):', style: TextStyle(fontFamily: 'MS_Sans_Serif', fontSize: 23))),
      Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 250,
                height: 30,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: WindowsXPIndeterminateBarPainter(_animation.value),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: CDKButtonWindowsXP(
                onPressed: _toggleIndeterminateL,
                child: Text(
                  _isRunningL ? 'Stop' : 'Start',
                  style: const TextStyle(fontFamily: 'MS_Sans_Serif', fontSize: 18),
                ),
              ),
            ),
          ]
      ),

      const SizedBox(height: 35),

      // Círculo de progreso estático
      const Padding(padding: EdgeInsets.all(8), child: Text('Circular Progress Bar:', style: TextStyle(fontFamily: 'MS_Sans_Serif', fontSize: 23))),
      Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 100,
                height: 100,
                child: CustomPaint(
                  painter: CircularProgressPainter(
                    progress: _progressC,
                    isIndeterminate: _isRunningC,
                    animation: _circularAnimation,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                _progressC.toStringAsFixed(1),
                style: const TextStyle(fontSize: 20, fontFamily: 'MS_Sans_Serif'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: CDKButtonWindowsXP(
                onPressed: () {
                  setState(() {
                    _progressC = (_progressC + 0.1);
                    if (_progressC > 1) {
                      _progressC = 0.0;
                    }
                  });
                },
                child: const Text('Increase', style: TextStyle(fontFamily: 'MS_Sans_Serif', fontSize: 18)),
              ),
            ),
          ]
      ),

      const SizedBox(height: 35),

      // Círculo de progreso indeterminado
      const Padding(padding: EdgeInsets.all(8), child: Text('Indeterminate Circular Progress Bar:', style: TextStyle(fontFamily: 'MS_Sans_Serif', fontSize: 23))),
      Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 100,
                height: 100,
                child: AnimatedBuilder(
                  animation: _circularAnimation,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: CircularProgressPainter(
                        progress: 0.0, // Siempre en 0 para ser indeterminado
                        isIndeterminate: true,
                        animation: _circularAnimation,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: CDKButtonWindowsXP(
                onPressed: _toggleIndeterminateC,
                child: Text(
                  _isRunningC ? 'Stop' : 'Start',
                  style: const TextStyle(fontFamily: 'MS_Sans_Serif', fontSize: 18),
                ),
              ),
            ),
          ]
      ),

      const SizedBox(height: 35),
    ]);
  }
}


// Pintor para la barra de progreso estática con cuadrados verdes
class WindowsXPBarPainter extends CustomPainter {
  final double progress;
  WindowsXPBarPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint squarePaint = Paint()..color = const Color(0xFF00FF00); 

    double squareWidth = 15; // Tamaño de los cuadrados
    double gap = 4; 
    int numSquares = (size.width / (squareWidth + gap)).floor(); // Número de cuadrados que caben

    // Calcular cuántos cuadrados mostrar en base al progreso
    int visibleSquares = (numSquares * progress).floor();

    // Dibujar los cuadrados
    for (int i = 0; i < visibleSquares; i++) {
      double x = i * (squareWidth + gap);
      if (x + squareWidth > 0 && x < size.width) {
        // Dibujar solo los cuadrados visibles
        canvas.drawRect(
            Rect.fromLTWH(x, size.height / 2 - squareWidth / 2, squareWidth,
                squareWidth),
            squarePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


// Pintor para la barra de progreso indeterminada con movimiento de cuadrados de izquierda a derecha
class WindowsXPIndeterminateBarPainter extends CustomPainter {
  final double progress;
  WindowsXPIndeterminateBarPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint squarePaint = Paint()..color = const Color(0xFF00FF00); 

    double squareWidth = 13; 
    double gap = 4; 
    int numSquares = (size.width / (squareWidth + gap)).floor(); // Número de cuadrados que caben

    // Calcular cuántos cuadrados mostrar en base al progreso
    int visibleSquares = (numSquares * progress).floor();

    // Desplazar los cuadrados de izquierda a derecha
    double offsetX = progress % size.width; // El desplazamiento ahora aumenta hacia la derecha

    // Dibujar los cuadrados moviéndose de izquierda a derecha
    for (int i = 0; i < visibleSquares; i++) {
      double x = (i * (squareWidth + gap)) + offsetX;
      if (x + squareWidth > 0 && x < size.width) {
        // Dibujar solo los cuadrados visibles
        canvas.drawRect(
            Rect.fromLTWH(x, size.height / 2 - squareWidth / 2, squareWidth,
                squareWidth),
            squarePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


// Pintor para el círculo de progreso (determinado o indeterminado)
class CircularProgressPainter extends CustomPainter {
  final double progress;
  final bool isIndeterminate;
  final Animation<double> animation;

  CircularProgressPainter({
    required this.progress,
    required this.isIndeterminate,
    required this.animation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintBackground = Paint()
      ..color = const Color(0xFFDDDDDD)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6; // Grosor del círculo de fondo

    Paint paintForeground = Paint()
      ..color = const Color.fromARGB(255, 76, 166, 182) // Color del progreso
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6; // Grosor del progreso

    double radius = size.width / 3.4; // Radio del círculo
    double progressAngle = 2 * 3.14159 * progress; // Ángulo de progreso

    // Dibujar el círculo de fondo
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paintBackground);

    if (isIndeterminate) {
      // Si es indeterminado, animamos el progreso
      double angle = animation.value * 2 * 3.14159; // Girar el círculo
      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
        -3.14159 / 2, 
        angle,
        false,
        paintForeground,
      );
    } else {
      // Si es determinado, dibujamos el progreso calculado
      canvas.drawArc(
        Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: radius),
        -3.14159 / 2, 
        progressAngle,
        false,
        paintForeground,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
