import 'package:flutter/material.dart';
import 'package:renderizacion/modelos.dart';

class DibujaLampara extends CustomPainter{
  List<Lamp> vLamp;
  double rad;

  DibujaLampara(this.vLamp, this.rad);

  @override
  void paint(Canvas canvas, Size size) {
    Paint pencil = Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.black
        ..strokeWidth = 1;

    // rendering...
    for(var item in vLamp) {
      Path path = Path();
      path.moveTo(item.x, item.y+2*item.height/5);
      path.quadraticBezierTo(item.x, item.y+4*item.height/5, item.x+2*item.width/5, item.y+4*item.height/5);
      path.lineTo(item.x, item.y+item.height);
      path.lineTo(item.x+item.width, item.y+item.height);
      path.lineTo(item.x+3*item.width/5, item.y+4*item.height/5);
      path.quadraticBezierTo(item.x+item.width, item.y+4*item.height/5, item.x+item.width, item.y+2*item.height/5);
      path.lineTo(item.x+3*item.width/5, item.y+2*item.height/5);
      path.quadraticBezierTo(item.x+3*item.width/5, item.y, item.x+item.width/2, item.y);
      path.quadraticBezierTo(item.x+2*item.width/5, item.y, item.x+2*item.width/5, item.y+2*item.height/5);
      path.lineTo(item.x, item.y+2*item.height/5);
      //path.close();

      // rotar desde 0 0
      /*
      canvas.save();
      canvas.translate(item.x, item.y);
      canvas.rotate(rad);
      canvas.translate(-item.x, -item.y);
       */

      // rotar desde el centro
      canvas.save();
      canvas.translate(item.x + item.width/2, item.y + item.height/2);
      canvas.rotate(rad);
      canvas.translate(-(item.x + item.width/2), -(item.y + item.height/2));

      pencil.color = item.color;
      pencil.style = PaintingStyle.fill;
      canvas.drawPath(path, pencil);

      pencil.color = Colors.black;
      pencil.style = PaintingStyle.stroke;
      canvas.drawPath(path, pencil);

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}