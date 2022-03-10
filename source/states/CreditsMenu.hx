package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import ui.PrxButton;

class CreditsMenu extends FlxState {
	override function create() {
		add(new PrxButton(FlxG.width-250, 100, "Menu", exitToMenu));
		add(new FlxText(0, 0, FlxG.width/2, "Collaborators:\ngoldenPiGames: programming, gameplay, organization\nSachikoFox: game icons", 24));
		add(new FlxText(FlxG.width/2, 250, FlxG.width/2, "Music used:", 24));
	}
	
	function exitToMenu() {
		FlxG.switchState(new MainMenu());
	}
}