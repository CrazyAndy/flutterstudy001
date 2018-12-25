import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      // return Column(
      //   children: <Widget>[
      //     IconBadge(
      //       Icons.pool,
      //       size: 64.0,
      //     )
      //   ],
      // );
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16.0/9.0,
              child: Container(
                color: Color.fromRGBO(3, 54, 255, 1.0),
              ),
            )
          ],
        ),
      );
    }
}

 
class StackDemo extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                SizedBox(
              width: 200.0,
              height: 300.0,
              child: Container(
                alignment: Alignment(0.5, 0.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(Icons.ac_unit,
                color: Colors.white,
                size: 32.0,),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            SizedBox( 
              width: 100.0,
              height: 100.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(Icons.monochrome_photos,
                color: Colors.white,
                size: 32.0,),
              ),
            ),
            // IconBadge(Icons.pool),
            // IconBadge(Icons.beach_access),
            // IconBadge(Icons.airplanemode_active),
              ],
            )
          ],
        ),
      );;
    }
}

class IconBadge extends StatelessWidget{
  final IconData icon;
  final double size;

  IconBadge(this.icon,{
    this.size = 32.0
  });

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        child: Icon(icon,size:size,color:Colors.white),
        width: size + 60,
        height: size +60,
        color: Color.fromRGBO(3, 54, 255, 1.0),
      );
    }
}