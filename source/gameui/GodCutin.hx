package gameui;

import flixel.FlxG;
import flixel.FlxSprite;
import misc.PrxMisc;

class GodCutin extends FlxSprite {
	public static inline var CHAR_AGAPE = 1;
	public static inline var CHAR_SOPHIA = 2;
	var time:Float = 0;
	public static var DURATION = 1;

	public function new(which:Int) {
		super();
		loadGraphic("assets/images/cutins/"+(which == CHAR_AGAPE ? "Agape" : "Sophia")+".png", false);
		alpha = 0;
		FlxG.watch.add(this, "time");
		FlxG.watch.add(this, "alpha");
		FlxG.watch.add(this, "y");
	}

	override function update(elapsed:Float) {
		if (time > 0) {
			time += elapsed / DURATION;
			y = FlxG.height * (.5 + .75 * PrxMisc.powSign(time*2-1, 3)) - height/2;
			alpha = 1 - Math.abs(.5 - time);
		}
		if (time > 1) {
			time = 0;
			alpha = 0;
		}
	}

	public function indicateGo() {
		if (time <= 0 || time > .5) {
			time = .01;
		}
	}
}