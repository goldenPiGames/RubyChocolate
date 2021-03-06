package ui;

import flixel.math.FlxPoint;
import flixel.text.FlxText;

class ScoreDisplay extends FlxText {
	var needed:Int;

	public function new(x:Float = 0, y:Float = 0, fieldWidth:Float = 200, size:Int = 16) {
		super(x, y, fieldWidth, "0", size);
		alignment = FlxTextAlign.RIGHT;
	}

	public function setScore(to:Int):Void {
		text = Std.string(to) + " / " + Std.string(needed);
	}

	public function defaultFloaterPosition():FlxPoint {
		return getMidpoint();
	}

	public function setNeeded(scoreNeeded:Int) {
		needed = scoreNeeded;
	}
}