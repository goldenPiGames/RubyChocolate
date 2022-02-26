package effects;

import flixel.math.FlxPoint;
import flixel.text.FlxText;

class ScoreFloater extends FlxText {
	var fadeRate:Float;
	var riseRate:Float;
	
	public function new(x:Float, y:Float, points:Int) {
		super(x-100, y-14, 200, "+"+points, 28);
		alpha = 1;
		fadeRate = 1;
		riseRate = 15;
		alignment = FlxTextAlign.CENTER;
	}
	
	override function update(elapsed:Float) {
		super.update(elapsed);
		alpha -= elapsed * fadeRate;
		y -= elapsed * riseRate;
		if (alpha <= 0) {
			kill();
		}
	}

	override function toString():String {
		return "("+text+"@"+x+","+y+")";
	}
}