package;

import kha.Color;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.input.Keyboard;

class Project {

	var player:Player;
	var floor:Rectangle;

	public function new() {
		player = new Player(100, 100, 32, 32, Color.Blue);
		floor = new Rectangle(50, 450, 700, 100, Color.Red);

		Keyboard.get().notify(onKeyDown, onKeyUp, null);

		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
	}

	function update(): Void {
		player.update();

		// simple detection and separation
		// it just separates from the top of the floor
		if (player.collide(floor))
			player.y = floor.y - player.height;
	}

	function render(framebuffer: Framebuffer): Void {
		var g2 = framebuffer.g2;

		g2.begin(true, Color.Black);
		
		player.render(g2);
		floor.render(g2);

		g2.end();
	}

	function onKeyDown(key:Int):Void
	{
		player.keyDown(key);
	}

	function onKeyUp(key:Int):Void
	{
		player.keyUp(key);
	}
}