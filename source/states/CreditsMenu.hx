package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import misc.PrxMusic;
import ui.PrxButton;

class CreditsMenu extends FlxState {
	static inline var COLLAB_CREDIT_TEXT = "Collaborators:
goldenPiGames: programming, gameplay, writing
SachikoFox: game pieces
DigitalSkrub: buttons
Kiyo: main menu, backgrounds. animations
thestupidmeddy: writing
KOLANI: scenario, animations, backgrounds, logo
Chosm: character design
Devoidgazer: backgrounds
FletcherEPS: Agape/Sophia portraits
JoshikoF: human portraits
ProsciuttoMan: scenario, character design, backgrounds characters
Funster: thumbnail
Pod: thumbnail";
	

	override function create() {
		add(new PrxButton(FlxG.width-250, 100, "Menu", exitToMenu));
		add(new FlxText(0, 0, FlxG.width/2, COLLAB_CREDIT_TEXT, 16));
		add(new FlxText(FlxG.width/2, 250, FlxG.width/2, PrxMusic.MUSIC_CREDIT_TEXT, 16));
	}
	
	function exitToMenu() {
		FlxG.switchState(new MainMenu());
	}
}