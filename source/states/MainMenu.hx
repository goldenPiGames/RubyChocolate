package states;

import flixel.FlxG;
import flixel.FlxState;
import ui.PrxButton;

class MainMenu extends FlxState {
	
	
	public override function create() {
		add(new PrxButton(100, 50, "Jewel", playJewels0));
		add(new PrxButton(100, 250, "Jewel", playJewels1));
		//add(new PrxButton(100, 400, "Same", playSame));
	}

	function playJewels0() {
		Passing.puzzle = "jewel";
		Passing.level = 0;
		FlxG.switchState(new PlayState());
	}
	
	function playJewels1() {
		Passing.puzzle = "jewel";
		Passing.level = 1;
		FlxG.switchState(new PlayState());
	}
	
	function playSame() {
		Passing.puzzle = "same";
		FlxG.switchState(new PlayState());
	}
}