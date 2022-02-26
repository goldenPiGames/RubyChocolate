package states;

import effects.ScoreFloater;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import misc.PrxTypedGroup;
import puzzle.BlockGridPuzzle;
import puzzle.PuzzleBase;
import puzzle.jewel.JewelPuzzle;
import puzzle.same.SamePuzzle;
import ui.ScoreDisplay;

class PlayState extends FlxState {
	var puzzle:PuzzleBase;
	var scoreDisplay:ScoreDisplay;
	var scoreFloaters:PrxTypedGroup<ScoreFloater>;

	override public function create() {
		super.create();
		switch (Passing.puzzle) {
			case "jewel": puzzle = new JewelPuzzle();
			case "same": puzzle = new SamePuzzle();
		}
		puzzle.setState(this);
		add(puzzle);
		scoreDisplay = new ScoreDisplay(600, 300, 200, 16);
		add(scoreDisplay);
		puzzle.scoreDisplay = scoreDisplay;
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
