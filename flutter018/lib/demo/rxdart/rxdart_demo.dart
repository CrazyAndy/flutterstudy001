import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {

  PublishSubject<String> _textFieldSubject;

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textFieldSubject.close();
  }

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _textFieldSubject = PublishSubject<String>();

    _textFieldSubject
    // .map((item)=>'item:$item')
    // .where((item) => item.length>4)
    .debounce(Duration(milliseconds:500))
    .listen(_onData);


      
      // Observable<String> _observable = 
      //   Observable(Stream.fromIterable([
      //     'hello','你好'
      //   ])); 
      
      // _observable.listen(print);

      // PublishSubject<String> _subject = 
      //   PublishSubject<String>();

      // _subject.listen(_onData);
      // _subject.add('hello');
    }

  void _onData(String data){
    print('listen 1: $data');
  }


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black
      ),
      child: TextField(
        onChanged: (value){
          _textFieldSubject.add(value);
        },
        onSubmitted: (value){
_textFieldSubject.add(value);
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true
        ),
      ),
    );
  }
}