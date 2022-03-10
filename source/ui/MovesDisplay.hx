package ui;

import flixel.math.FlxPoint;
import flixel.text.FlxText;

class MovesDisplay extends FlxText {
	public function new(x:Float = 0, y:Float = 0, fieldWidth:Float = 200, size:Int = 16) {
		super(x, y, fieldWidth, "", size);
		alignment = FlxTextAlign.LEFT;
	}

	public function setLeft(to:Int):Void {
		text = "Moves left: " + Std.string(to);
	}

	public function setUnlimited() {
		text = "Moves left: Infinite";
	}
}