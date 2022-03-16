package puzzle;

import flixel.FlxBasic;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import gameui.GodCutin;
import realanim.RealAnim;
import states.PlayState;
import ui.MovesDisplay;
import ui.ScoreDisplay;

class PuzzleBase extends FlxTypedGroup<FlxBasic> {
	var state:PlayState;
	var realanim:RealAnim;
	var random:FlxRandom;
	var waitingForPiece = false;
	public var score:Int;
	public var scoreNeeded:Int;
	var movesLeft:Int;
	public var scoreDisplay:ScoreDisplay;
	public var movesDisplay:MovesDisplay;
	var cutinAgape:GodCutin;
	var cutinSophia:GodCutin;
	
	public function new() {
		super();
		score = 0;
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
		setScore(score + amount);
		if (location == null) {
			if (scoreDisplay != null)
				location = scoreDisplay.defaultFloaterPosition();
		}
		state.addScoreFloater(amount, location);
	}

	function setScore(amount:Int) {
		score = amount;
		if (scoreDisplay != null)
			scoreDisplay.setScore(score);
	}

	public function setScoreDisplay(s:ScoreDisplay):Void {
		scoreDisplay = s;
		scoreDisplay.setNeeded(scoreNeeded);
		scoreDisplay.setScore(score);
	}

	public function setMovesDisplay(m:MovesDisplay):Void {
		movesDisplay = m;
		updateMovesDisplay();
	}

	function setNumMoves(macs:Int):Void {
		movesLeft = macs;
		updateMovesDisplay();
	}

	function tookMove() {
		movesLeft--;
		updateMovesDisplay();
		if (movesLeft <= 0) {
			state.puzzleOver();
		}
	}

	inline function updateMovesDisplay():Void {
		if (movesDisplay != null)
			movesDisplay.setLeft(movesLeft);
	}

	function setScoreNeeded(nyep:Int):Void {
		scoreNeeded = nyep;
		if (scoreDisplay != null) {
			scoreDisplay.setNeeded(scoreNeeded);
			scoreDisplay.setScore(score);
		}
	}

	public function setCutins(agape:GodCutin, sophia:GodCutin) {
		cutinAgape = agape;
		cutinSophia = sophia;
	}
}