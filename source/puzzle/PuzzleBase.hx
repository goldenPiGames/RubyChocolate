package puzzle;

import flixel.FlxBasic;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxRandom;
import gameui.ScoreDisplay;

class PuzzleBase extends FlxTypedGroup<FlxBasic> {
	var random:FlxRandom;
	var waitingForPiece = false;
	var score:Int;
	public var scoreDisplay:ScoreDisplay;
	
	public function new() {
		super();
		random = new FlxRandom();
	}

	public override function update(elapsed:Float) {
		waitingForPiece = false;
		super.update(elapsed);
	}

	public function indicateMoveWait() {
		waitingForPiece = true;
	}

	function scorePoints(amount:Int) {
		score += amount;
		scoreDisplay.setScore(score);
	}

	function scramble():Void {
		
	}
}