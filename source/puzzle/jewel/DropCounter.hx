package puzzle.jewel;

import flixel.FlxSprite;

class DropCounter extends FlxSprite {
	public function new(x, y) {
		super(x, y);
		loadGraphic("assets/images/DropCounter.png", true, 256, 64);
		animation.add("0", [0]);
		animation.add("1", [1]);
		animation.add("2", [2]);
		animation.add("3", [3]);
		animation.add("4", [4]);
		animation.add("Drop", [5, 0], 1, false);
		animation.play("0");
	}

	public function playMove(until:Int):Void {
		if (until > 0)
			animation.play(Std.string(5-until));
	}
	
	public function playDrop():Void {
		animation.play("Drop");
	}

}