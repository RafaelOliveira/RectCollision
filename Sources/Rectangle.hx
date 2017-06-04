package;

import kha.Color;
import kha.graphics2.Graphics;

class Rectangle
{
	public var x:Float;
	public var y:Float;	
	public var width:Int;
	public var height:Int;
	public var color:Color;

	public function new(x:Float, y:Float, width:Int, height:Int, color:Color):Void
	{
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
		this.color = color;
	}	

	public function render(g2:Graphics):Void
	{
		g2.color = color;
		g2.fillRect(x, y, width, height);
	}

	public function collide(rect:Rectangle):Bool
	{
		if (x + width > rect.x && y + height > rect.y &&
		x < rect.x + rect.width && y < rect.y + rect.height)
			return true;
		else
			return false;
	}
}