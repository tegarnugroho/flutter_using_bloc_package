import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_using_bloc_package/color_bloc.dart';

void main() => runApp(UsingBLoc());

class UsingBLoc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
          builder: (context) => ColorBloc(), child: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Using BLoc Package'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              bloc.dispatch(ColorEvent.to_amber);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              bloc.dispatch(ColorEvent.to_light_blue);
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            width: 100,
            height: 100,
            color: currentColor,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
