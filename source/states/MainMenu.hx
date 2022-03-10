package states;

import flixel.FlxG;
import flixel.FlxState;
import ui.PrxButton;

class MainMenu extends PrxState {
	
	
	public override function create() {
		super.create();
		add(new PrxButton(100, 50, "Tutorial", playJewels0));
		add(new PrxButton(100, 200, "GamingVsAnime", playJewels1));
		add(new PrxButton(100, 350, "OldPeople", playJewels2));
		add(new PrxButton(100, 500, "Revolution", playJewels3));
		add(new PrxButton(FlxG.width-250, 100, "Credits", seeCredits));
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
	
	function playJewels2() {
		Passing.puzzle = "jewel";
		Passing.level = 2;
		FlxG.switchState(new PlayState());
	}
	
	function playJewels3() {
		Passing.puzzle = "jewel";
		Passing.level = 3;
		FlxG.switchState(new PlayState());
	}
	
	function playSame() {
		Passing.puzzle = "same";
		FlxG.switchState(new PlayState());
	}

	function seeCredits() {
		FlxG.switchState(new CreditsMenu());
	}
}