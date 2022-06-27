import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_8/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BLoC with flutter_bloc',
        home: BlocProvider(
          create: (context) => ColorBloc(),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('BLoC with flutter_bloc'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            height: 100,
            width: 100,
            duration: Duration(milliseconds: 500),
            color: currentColor,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _bloc.add(RedColorEvent());
            },
            backgroundColor: Colors.red,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.add(GreenColorEvent());
            },
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
