package gameui;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import puzzle.PuzzleBase;
import states.MainMenu;
import states.PlayState;
import ui.PrxButton;

class GameResults extends FlxTypedGroup<FlxBasic> {
	var puzzle:PuzzleBase;

	public function new(thepuzzle:PuzzleBase) {
		super();
		puzzle = thepuzzle;
		add(new PrxButton(20, 300, "Retry", retryLevel));
		add(new PrxButton(327, 300, "Menu", exitToMenu));
	}

	function retryLevel() {
		FlxG.switchState(new PlayState());
	}

	function exitToMenu() {
		FlxG.switchState(new MainMenu());
	}
}