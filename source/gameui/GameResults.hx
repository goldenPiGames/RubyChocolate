package gameui;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import misc.NGio;
import puzzle.PuzzleBase;
import states.MainMenu;
import states.PlayState;
import ui.PrxButton;

class GameResults extends FlxTypedGroup<FlxBasic> {
	var darkness:FlxSprite;
	var puzzle:PuzzleBase;
	var scoreGot:Int;
	var scoreNeeded:Int;
	public var success:Bool;

	public function new(thepuzzle:PuzzleBase) {
		super();
		darkness = new FlxSprite(0, 0);
		darkness.makeGraphic(FlxG.width, FlxG.height, 0x80404040);
		add(darkness);
		puzzle = thepuzzle;
		scoreGot = puzzle.score;
		scoreNeeded = puzzle.scoreNeeded;
		success = scoreGot >= scoreNeeded;
		
		if (success) {
			add(new FlxSprite(26, 60, "assets/images/MatchMade.png"));
			NGio.submitStagePassed();
		} else {
			add(new FlxSprite(48, 60, "assets/images/GameOver.png"));
		}
		var scoreText = new FlxText(200, 366, 184, Std.string(scoreGot), 24);
		scoreText.alignment = FlxTextAlign.CENTER;
		add(scoreText);
		add(new PrxButton(52, 400, "Retry", retryLevel));
		add(new PrxButton(362, 400, "Menu", exitToMenu));
	}

	function retryLevel() {
		FlxG.switchState(new PlayState());
	}

	function exitToMenu() {
		FlxG.switchState(new MainMenu());
	}
}