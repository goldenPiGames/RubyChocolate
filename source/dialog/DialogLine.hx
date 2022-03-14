package dialog;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class DialogLine {
	public var text:String;
	public var speaker:String;
	public var portrait:FlxSprite;
	public var music:String;
	public var backdrop:FlxGraphicAsset;

	public function new(dats:DialogLineData) {
		text = dats.text;
		speaker = dats.speaker;
		var portraitName = speaker;
		if (dats.portrait != null)
			portraitName = dats.portrait;
		portrait = new FlxSprite(0, 0, "assets/images/portraits/"+portraitName+".png");
		portrait.setPosition(FlxG.width-portrait.width-20, FlxG.height-portrait.height);
		music = dats.music;
		backdrop = dats.backdrop;
	}
}

typedef DialogLineData = {
	speaker:String,
	?portrait:String,
	text:String,
	?music:String,
	?backdrop:String,
}