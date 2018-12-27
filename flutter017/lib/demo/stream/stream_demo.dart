import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  String _data = '...';

  @override
  void dispose() {
    // TODO: implement dispose
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('create a stream');

    _streamDemo = StreamController.broadcast();

    _sinkDemo = _streamDemo.sink;

    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    print('Start listening on a stream');
    // _streamSubscription =
    //     _streamDemo.listen(onData, onError: onError, onDone: onDone);
    _streamSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);

    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
    print('Initialize completed.');
  }

  void onData(String data) {
    // setState(() {
    //   _data = data;
    // });
    print('onData : $data');
  }

  void onDataTwo(String data) {
    print('onDataTwo : $data');
  }

  void onError(error) {
    print('Error:${error}');
  }

  void onDone() {
    print('Done!');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw 'Something happened';
    return 'hello ~';
  }

  void _addData2Stream() async {
    print('add data to stream');
    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  void _pauseStream() {
    print('Pause subscription');
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print('Resume subscription');
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print('cancel subscription');
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(_data),
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (context,snapshot){
                return Text('${snapshot.data}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addData2Stream,
                ),
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: _cancelStream,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
