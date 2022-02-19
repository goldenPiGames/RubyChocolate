package;

import flixel.FlxState;
import gameui.ScoreDisplay;
import puzzle.BlockGridPuzzle;
import puzzle.PuzzleBase;
import puzzle.jewel.JewelPuzzle;

class PlayState extends FlxState {
	var puzzle:PuzzleBase;
	var scoreDisplay:ScoreDisplay;

	override public function create() {
		super.create();
		puzzle = new JewelPuzzle();
		add(puzzle);
		scoreDisplay = new ScoreDisplay(600, 300, 200, 16);
		add(scoreDisplay);
		puzzle.scoreDisplay = scoreDisplay;
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
