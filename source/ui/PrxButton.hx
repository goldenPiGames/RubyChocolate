package ui;

import flixel.FlxG;
import flixel.FlxSprite;

class PrxButton extends FlxSprite {
	var what:String;
	var func:Void->Void;

	public override function new(x:Float, y:Float, thewhat:String, thefunc:Void->Void) {
		super(x, y);
		what = thewhat;
		func = thefunc;
		loadButtonGraphic();
	}
	
	function loadButtonGraphic() {
		loadGraphic("assets/images/buttons/"+what+".png");
		updateHitbox();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);
		if (func != null && FlxG.mouse.justPressed && FlxG.mouse.overlaps(this)) {
			func();
		}
	}
}