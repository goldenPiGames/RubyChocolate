package misc;

import flixel.FlxG;

class PrxMusic {
	static var currID:String;
	static var currData:PrxMusicData;
	
	static final MUSIC_DATA:Map<String, PrxMusicData> = [
		"Rift"=>{
			title:"-Rift-",
			author:"Predator, HOJL, Hyenaedon, Hypervolt",
			filename:"Rift.mp3",
			//loopStart:0,
			//loopEnd:199,
		},
		"AfternoonDaydream"=>{
			title:"Afternoon Daydream",
			author:"TebyTheCat",
			filename:"AfternoonDaydream.mp3",
			//loopStart:0,
			//loopEnd:112,
		},
		"CoffeeLounge"=>{
			title:"Coffee Lounge",
			author:"PeriTune",
			filename:"CoffeeLounge.ogg",
		},
	];

	public static function play(id) {
		var dats:PrxMusicData = MUSIC_DATA.get(id);
		trace(id);
		trace(dats);
		if (dats != null) {
			currID = id;
			FlxG.sound.playMusic("assets/music/"+dats.filename, 1, true);
			//if (dats.loopStart != null)
			//	FlxG.sound.music.loopTime = dats.loopStart;
		}
	}

	public static function getDisplayFor(dats:PrxMusicData):String {
		if (currData == null)
			return "";
		else
			return currData.title + " - " + currData.author;
	}

	public static function getCurrDisplay():String {
		return getDisplayFor(currData);
	}
}

typedef PrxMusicData = {
	title:String,
	author:String,
	filename:String,
	?loopStart:Float,
	?loopEnd:Float,
}