import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
            data: Theme.of(context).copyWith(
                buttonColor: Theme.of(context).accentColor,
                buttonTheme: ButtonThemeData(
                    textTheme: ButtonTextTheme.primary,
                    // shape: BeveledRectangleBorder(
                    //   borderRadius: BorderRadius.circular(5.0)
                    // ),
                    shape: StadiumBorder())),
            child: RaisedButton(
              child: Text('Button'),
              onPressed: () {},
              splashColor: Colors.grey,
              textColor: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            )),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    final Widget outLineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
            data: Theme.of(context).copyWith(
                buttonColor: Theme.of(context).accentColor,
                buttonTheme: ButtonThemeData(
                    textTheme: ButtonTextTheme.primary,
                    // shape: BeveledRectangleBorder(
                    //   borderRadius: BorderRadius.circular(5.0)
                    // ),
                    shape: StadiumBorder())),
            child: OutlineButton(
              child: Text('Button'),
              onPressed: () {},
              splashColor: Colors.grey[100],
              borderSide: BorderSide(color: Colors.black),
              textColor: Colors.black,
              highlightedBorderColor: Colors.grey,
            )),
        SizedBox(
          width: 16.0,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );
    final Widget fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 160.0,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        )
      ],
    );
    final Widget extendWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          flex: 2,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
      ],
    );
    final Widget buttonBarButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                  padding: EdgeInsets.symmetric(horizontal: 10.0))),
          child: ButtonBar(children: <Widget>[
            OutlineButton(
              child: OutlineButton(
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
            ),
            OutlineButton(
              child: OutlineButton(
                child: Text('Button'),
                onPressed: () {},
                splashColor: Colors.grey[100],
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
            ),
          ]),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flatButtonDemo,
            raisedButtonDemo,
            outLineButtonDemo,
            fixedWidthButton,
            extendWidthButton,
            buttonBarButton
          ],
        ),
      ),
    );
  }
}