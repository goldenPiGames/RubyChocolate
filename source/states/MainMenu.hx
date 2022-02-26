package states;

import flixel.FlxG;
import flixel.FlxState;
import ui.PrxButton;

class MainMenu extends FlxState {
	
	
	public override function create() {
		add(new PrxButton(100, 100, "Jewel", playJewels));
		add(new PrxButton(100, 400, "Same", playSame));
	}

	function playJewels() {
		Passing.puzzle = "jewel";
		FlxG.switchState(new PlayState());
	}
	
	function playSame() {
		Passing.puzzle = "same";
		FlxG.switchState(new PlayState());
	}
}