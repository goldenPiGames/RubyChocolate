package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import misc.PrxMusic;
import ui.PrxButton;

class MainMenu extends PrxState {
	var back:FlxSprite;
	var logo:FlxSprite;

	static inline var LEVEL_ALIGN:Int = 216;
	
	public override function create() {
		super.create();
		back = new FlxSprite(0, 0, "assets/images/MainMenuBack.png");
		add(back);
		back.setGraphicSize(0, FlxG.height);
		back.updateHitbox();
		back.setPosition(0, 0);
		logo = new FlxSprite(0, 0, "assets/images/MainMenuLogo.png");
		add(logo);
		logo.setGraphicSize(0, Std.int(FlxG.height*420/1334));
		logo.updateHitbox();
		logo.setPosition(FlxG.width-logo.width, 0);
		add(new PrxButton(LEVEL_ALIGN-148, 30, "Tutorial", playJewels0));
		add(new PrxButton(LEVEL_ALIGN-197, 150, "GamingVsAnime", playJewels1));
		add(new PrxButton(LEVEL_ALIGN-117, 290, "OldPeople", playJewels2));
		add(new PrxButton(LEVEL_ALIGN-200, 470, "Revolution", playJewels3));
		add(new PrxButton(FlxG.width-200, FlxG.height/2-50, "Credits", seeCredits));
		PrxMusic.play("Decisions");
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
		Passing.scene = "GamerVsWeeb";
		FlxG.switchState(new PlayState());
	}
	
	function playJewels2() {
		Passing.puzzle = "jewel";
		Passing.level = 2;
		Passing.scene = "OldPeople";
		FlxG.switchState(new PlayState());
	}
	
	function playJewels3() {
		Passing.puzzle = "jewel";
		Passing.level = 3;
		Passing.scene = "Revolution";
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