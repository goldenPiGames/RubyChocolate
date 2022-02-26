package puzzle;

import flixel.FlxBasic;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import states.PlayState;
import ui.ScoreDisplay;

class PuzzleBase extends FlxTypedGroup<FlxBasic> {
	var random:FlxRandom;
	var waitingForPiece = false;
	var score:Int;
	public var scoreDisplay:ScoreDisplay;
	var state:PlayState;
	
	public function new() {
		super();
		random = new FlxRandom();
	}

	public function setState(instate:PlayState) {
		state = instate;
	}

	public override function update(elapsed:Float) {
		waitingForPiece = false;
		super.update(elapsed);
	}

	public inline function indicateMoveWait() {
		waitingForPiece = true;
	}

	function scorePoints(amount:Int, ?location:FlxPoint) {
		score += amount;
		scoreDisplay.setScore(score);
		if (location == null)
			location = scoreDisplay.defaultFloaterPosition();
		state.addScoreFloater(amount, location);
	}
}