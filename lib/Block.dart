import 'dart:async';

import 'package:angrybird/main.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class Block extends PositionComponent{
  @override
  final double height;
  final double width;
  final Paint paint;

  Block(Vector2 position,{
    this.width=50,this.height=100,Color color=Colors.brown
  })
  :paint=Paint()..color=color{
    this.position=position;
  }

  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    
    add(RectangleHitbox(collisionType:CollisionType.passive));
  }

   
  @override
  void render(Canvas canvas){
    super.render(canvas);
    canvas.drawRect(
      Rect.fromLTWH(position.x, position.y, width, height),paint);
  }
}
    
  
  class pyramid extends Component{
    final FlameGame game;
    pyramid(this.game){
      _createblocks();

    }

    void _createblocks(){
      final List<Vector2>blockPositions=[
        Vector2(242, 47),
        Vector2(270, 47),
        Vector2(228, 98),
        Vector2(256,98),

        Vector2(284, 98),
        Vector2(214, 149),
        Vector2(242, 149),
        Vector2(270, 149),
        Vector2(298, 149),
        Vector2(200, 200),
        Vector2(228, 200),
        Vector2(256, 200),
        Vector2(284, 200),
        Vector2(312, 200),

        
      ];

      for(final position in blockPositions){
        final block=Block(position);
        game.add(block);
      }
    }
  }





