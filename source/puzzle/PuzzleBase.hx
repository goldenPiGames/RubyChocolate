package puzzle;

import flixel.FlxBasic;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import realanim.RealAnim;
import states.PlayState;
import ui.MovesDisplay;
import ui.ScoreDisplay;

class PuzzleBase extends FlxTypedGroup<FlxBasic> {
	var state:PlayState;
	var realanim:RealAnim;
	var random:FlxRandom;
	var waitingForPiece = false;
	var score:Int;
	var movesLeft:Int;
	public var scoreDisplay:ScoreDisplay;
	public var movesDisplay:MovesDisplay;
	
	public function new() {
		super();
		random = new FlxRandom();
	}

	public function setState(instate:PlayState) {
		state = instate;
	}

	public function setRealAnim(inrealanim:RealAnim) {
		realanim = inrealanim;
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

	public function setMovesDisplay(m:MovesDisplay) {
		movesDisplay = m;
		movesDisplay.setLeft(movesLeft);
	}

	function setNumMoves(macs:Int):Void {
		movesLeft = macs;
	}

	function tookMove() {
		movesLeft--;
		movesDisplay.setLeft(movesLeft);
	}
}