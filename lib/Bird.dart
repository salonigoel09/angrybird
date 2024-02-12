import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/input.dart';

import 'package:angrybird/main.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';


class Bird extends SpriteComponent with HasGameRef<angrybirdgame>,CollisionCallbacks{
  double totalTime=0;
  double gravity=10.0;
  final double bias=10.0;
  


  /*static final _paint=Paint()..color= Colors.white;
  @override 
  void render(Canvas canvas){
    canvas.drawRect(size.toRect(),_paint);
  }
*/  
Bird():super(anchor: Anchor.center,
size:Vector2(50, 50),
position: Vector2(70, 420));

 







@override
Future<void>onLoad()async{
  await super.onLoad();
  sprite=await gameRef.loadSprite('angrybird.png');
  add(RectangleHitbox(collisionType:CollisionType.active));
  //position=gameRef.size/2;
}




double velocity_x=0;
double velocity_y=0;
bool isthrow=false;

void Throw(Vector2 coordinates,double velocity){
  isthrow=true;
  velocity_x=(-coordinates.x);
  velocity_y=(-coordinates.y);
  

}

@override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    totalTime+=dt;

    if (isthrow){
      move(Vector2(velocity_x, velocity_y)
      
      );

      double positionY=((velocity_y/bias)*totalTime)+(gravity*totalTime*totalTime/2);
       position.y += positionY;
      // position.y += dt * velocityY;
      position.x += dt * velocity_x;
    }



    if(position.x<- width || position.y>game.size.y||
    position.x>game.size.x){
      game.resetGame(
      
      );
      
    }


      void onColiisionStart(
    Set<Vector2>intersectionPoints,
    PositionComponent other,
  ){
    super.onCollisionStart(intersectionPoints, other);
    if(other is Block){
      removeFromParent();
      other.removeFromParent();
      
    }
  }
  }





  void move(Vector2 pos){
    position.add(pos);
  }
  

}

