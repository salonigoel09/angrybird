import 'package:angrybird/Block.dart';
import 'package:flame/components.dart';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:angrybird/Bird.dart';
import 'package:flutter/services.dart';
class angrybirdgame extends FlameGame with PanDetector,KeyboardEvents, HasCollisionDetection{
  late Bird bird;

   TextComponent t1 = TextComponent(
    text: 'Direction: 0',
  );
   TextComponent velocityText = TextComponent(
    text: 'Velocity: 0',
  );


  @override
  

  
  @override
  Future<void>onLoad()async{
    await super.onLoad();

    //final birdsprite=await loadSprite('angrybird.png');

    bird=Bird();
    final Pyramid=pyramid(this);
    add(Pyramid);

    

    
      
      add(bird
      
      );
      
add(t1..position = Vector2(size.x / 2, 0));
add(velocityText..position = Vector2(size.x / 2, 40));

      
      

      
    

  }


  @override
  void onPanUpdate(DragUpdateInfo info){
    print("hello");
   Vector2 direction = info.delta.global;
   double velocity = info.delta.global.length;
   velocityText.text = 'Velocity: $velocity';
   t1.text = "value : $direction";
   //bird.move(direction);
   bird.Throw(direction, velocity);

  }

  void resetGame(){
    bird.totalTime=0;

     bird.isthrow=false;
    bird.position=Vector2(70, 420);
    
  }

  
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isR = keysPressed.contains(LogicalKeyboardKey.keyR);

    if (isR) {
      resetGame();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

}

void main(){
  runApp(GameWidget(game: angrybirdgame()));
}