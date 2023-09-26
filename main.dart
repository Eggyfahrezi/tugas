import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FirstScreen()),
                );
              },
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Tap Saya!',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onDoubleTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Double Tap Saya!',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onLongPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
              },
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Long Press Saya!',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DragZoomScreen()),
                );
              },
              child: Text('Drag & Zoom Saya!'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman 1'),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Ini adalah Halaman 1',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman 2'),
      ),
      body: Center(
        child: Container(
          color: Colors.green,
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Ini adalah Halaman 2',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman 3'),
      ),
      body: Center(
        child: Container(
          color: Colors.red,
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Ini adalah Halaman 3',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class DragZoomScreen extends StatefulWidget {
  @override
  _DragZoomScreenState createState() => _DragZoomScreenState();
}

class _DragZoomScreenState extends State<DragZoomScreen> {
  double _left = 0.0;
  double _top = 0.0;
  double _scale = 1.0;
  double _previousScale = 1.0;
  Offset _initialFocalPoint = Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag & Zoom'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: _left,
            top: _top,
            child: GestureDetector(
              onScaleStart: (details) {
                _initialFocalPoint = details.focalPoint;
              },
              onScaleEnd: (details) {
                setState(() {
                  _previousScale = _scale;
                });
              },
              child: Transform.scale(
                scale: _scale,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.orange,
                  child: Center(
                    child: Text(
                      'Zoom In/Out Saya!',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              onScaleUpdate: (details) {
                setState(() {
                  _scale = _previousScale * details.scale;
                  _left += (details.focalPoint.dx - _initialFocalPoint.dx);
                  _top += (details.focalPoint.dy - _initialFocalPoint.dy);
                  _initialFocalPoint = details.focalPoint;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
