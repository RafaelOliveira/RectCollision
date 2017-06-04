package;

import kha.Color;
import kha.input.KeyCode;

class Player extends Rectangle
{
	var velocityX:Float;
	var velocityY:Float;
	var speed:Float = 3;

	public function new(x:Float, y:Float, width:Int, height:Int, color:Color):Void
	{
		super(x, y, width, height, color);

		velocityX = 0;
		velocityY = 0;
	}

	public function update():Void
	{
		x += velocityX;
		y += velocityY;
	}

	public function keyDown(key:Int):Void
	{
		switch(key)
		{
			case KeyCode.Up: 	velocityY = -speed;
			case KeyCode.Down: 	velocityY = speed;
			case KeyCode.Left: 	velocityX = -speed;
			case KeyCode.Right: velocityX = speed;
		}
	}

	public function keyUp(key:Int):Void 
	{
		switch(key)
		{
			case KeyCode.Up: 	velocityY = 0;
			case KeyCode.Down: 	velocityY = 0;
			case KeyCode.Left: 	velocityX = 0;
			case KeyCode.Right: velocityX = 0;
		}
	}
}