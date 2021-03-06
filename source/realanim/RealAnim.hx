package realanim;

import flixel.FlxG;
import flixel.FlxSprite;
import states.PlayState;

abstract class RealAnim extends FlxSprite {
	var state:PlayState;
	
	public function new(x:Float = 580, y:Float = 320) {
		super(x, y);
		createAnims();
		setPosition(FlxG.width-width, FlxG.height-height);
	}

	abstract private function createAnims():Void;

	public function setState(instate:PlayState) {
		state = instate;
	}

	public function indicateMatch(length:Int):Void {
		if (length > 3)
			animation.play("match", true);
	}

	public function indicateCombo(length:Int):Void {
		if (length > 1)
			animation.play("combo", true);
	}

	public function indicateMoveEnd() {
		
	}

	public function indicatePoison() {
		
	}

	public function indicateComboEnd(comboMatch:Int, biggestMatch:Int) {
		if (comboMatch <= 1 && biggestMatch < 4) {
			animation.play("idle");
		}
	}
}