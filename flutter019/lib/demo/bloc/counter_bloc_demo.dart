import 'package:flutter/material.dart';
import 'dart:async';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
      // child: ActionChip(
      //   label: Text('0'),
      //   onPressed: () {
      //     // _counterBloc.log();
      //     _counterBloc.counter.add(2);
      //   },
      // ),
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: () {
              _counterBloc.counter.add(2);
            },
          );
        },
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  CounterProvider({this.child, this.bloc}) : super(child: child);

  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider);
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // _counterBloc.log();
        _counterBloc.counter.add(1);
      },
    );
  }
}

class CounterBloc {
  int _count = 0;
  final _countActionController = StreamController<int>();
  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream;

  StreamSink<int> get counter => _countActionController.sink;

  CounterBloc() {
    _countActionController.stream.listen(onData);
  }
  void onData(int data) {
    print(data);
    _count = data + _count;
    _counterController.add(_count);
  }

  void dispose() {
    _countActionController.close();
    _counterController.close();
  }

  void log() {
    print('Bloc');
  }
}
