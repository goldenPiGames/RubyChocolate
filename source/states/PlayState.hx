package states;

import effects.ScoreFloater;
import flixel.FlxG;
import flixel.FlxState;
import flixel.graphics.tile.FlxDrawTrianglesItem;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import misc.PrxTypedGroup;
import puzzle.BlockGridPuzzle;
import puzzle.PuzzleBase;
import puzzle.jewel.JewelPuzzle;
import puzzle.same.SamePuzzle;
import realanim.RealAnim;
import realanim.TestAnim;
import ui.MovesDisplay;
import ui.ScoreDisplay;

class PlayState extends FlxState {
	var puzzle:PuzzleBase;
	var realanim:RealAnim;
	var scoreDisplay:ScoreDisplay;
	var movesDisplay:MovesDisplay;
	var scoreFloaters:PrxTypedGroup<ScoreFloater>;

	override public function create() {
		super.create();
		switch (Passing.puzzle + Passing.level) {
			case "jewel0": puzzle = new JewelPuzzle(); realanim = new TestAnim();
			case "same0": puzzle = new SamePuzzle(); realanim = new TestAnim();
		}
		puzzle.setState(this);
		add(puzzle);
		realanim.setState(this);
		add(realanim);
		puzzle.setRealAnim(realanim);
		scoreDisplay = new ScoreDisplay(600, 300, 200, 16);
		add(scoreDisplay);
		puzzle.scoreDisplay = scoreDisplay;
		movesDisplay = new MovesDisplay(600, 240, 200, 16);
		add(movesDisplay);
		puzzle.setMovesDisplay(movesDisplay);
		scoreFloaters = new FlxTypedGroup<ScoreFloater>();
		add(scoreFloaters);
		FlxG.watch.add(scoreFloaters, "members");
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}

	public function addScoreFloater(amount:Int, location:FlxPoint) {
		scoreFloaters.deletNonexistent();
		scoreFloaters.add(new ScoreFloater(location.x, location.y, amount));
	}
}
