package realanim;

import flixel.FlxSprite;

class RevolutionAnim extends RealAnim {
	var behind:FlxSprite;
	var poisonBuffer:Bool = false;

	public function new() {
		super();
	}

	function createAnims() {
		loadGraphic("assets/images/realanim/Revolution.png", true, 400, 300);
		animation.add("idle", [0], 2, true);
		animation.add("match", [2], 2, true);
		animation.add("combo", [2], 2, true);
		animation.add("poison", [1], 2, true);
		animation.play("idle");
		this.behind = new FlxSprite();
		behind.loadGraphic("assets/images/realanim/RevolutionBack.png", true, 400, 300);
		behind.animation.add("constant", [0,1,2], 8, true);
		behind.animation.play("constant");
	}

	override function setPosition(a:Float=0, b:Float=0) {
		super.setPosition(a, b);
		behind.setPosition(a, b);
	}

	override function update(elapsed:Float) {
		super.update(elapsed);
		behind.update(elapsed);
	}

	override function draw() {
		behind.draw();
		super.draw();
	}

	override function indicatePoison() {
		animation.play("poison");
		poisonBuffer = true;
	}

	override function indicateComboEnd(comboMatch:Int, biggestMatch:Int) {
		if (comboMatch <= 1 && biggestMatch < 4) {
			if (poisonBuffer)
				poisonBuffer = false;
			else
				animation.play("idle");
		}
	}
}