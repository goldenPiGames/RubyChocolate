package states;

import effects.ScoreFloater;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import gameui.GameResults;
import misc.PrxMusic;
import misc.PrxTypedGroup;
import puzzle.BlockGridPuzzle;
import puzzle.PuzzleBase;
import puzzle.jewel.JewelPuzzle;
import puzzle.jewel.JewelTutorial;
import puzzle.same.SamePuzzle;
import realanim.RealAnim;
import realanim.TestAnim;
import ui.MovesDisplay;
import ui.PrxButton;
import ui.ScoreDisplay;

class PlayState extends PrxState {
	var puzzle:PuzzleBase;
	var results:GameResults;
	var realanim:RealAnim;
	var scoreDisplay:ScoreDisplay;
	var movesDisplay:MovesDisplay;
	var scoreFloaters:PrxTypedGroup<ScoreFloater>;
	var options:PrxTypedGroup<PrxButton>;

	override public function create() {
		super.create();
		switch (Passing.puzzle + Passing.level) {
			case "jewel0": puzzle = new JewelTutorial(); realanim = new TestAnim(); PrxMusic.play("CoffeeLounge");
			case "jewel1": puzzle = new JewelPuzzle(); realanim = new TestAnim(); PrxMusic.play("Rift");
			case "jewel2": puzzle = new JewelPuzzle(); realanim = new TestAnim(); PrxMusic.play("AfternoonDaydream");
			case "jewel3": puzzle = new JewelPuzzle(); realanim = new TestAnim();
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
		options = new FlxTypedGroup<PrxButton>();
		add(options);
		options.add(new PrxButton(FlxG.width-48, 0, "Back", exitToMenu));
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}

	public function addScoreFloater(amount:Int, location:FlxPoint) {
		scoreFloaters.deletNonexistent();
		scoreFloaters.add(new ScoreFloater(location.x, location.y, amount));
	}

	function exitToMenu() {
		FlxG.switchState(new MainMenu());
	}

	public function puzzleOver() {
		puzzle.active = false;
		results = new GameResults(puzzle);
		add(results);
	}
}
