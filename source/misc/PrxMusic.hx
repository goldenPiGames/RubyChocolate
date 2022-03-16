package misc;

import flixel.FlxG;
import flixel.system.FlxSound;

class PrxMusic {
	static var currID:String;
	static var currData:PrxMusicData;
	public static inline var MUSIC_CREDIT_TEXT = "Music used:
Decisions - Eric Matyas
Coffee Lounge - PeriTune
Rift - HOJL, Hyenaedon, Predator, Hypervolt
Afternoon Daydream - TebyTheCat
Dramatic 5 - PeriTune

Sound Effects: mixkit";
	
	static final MUSIC_DATA:Map<String, PrxMusicData> = [
		"Decisions"=>{
			title:"Decisions",
			author:"Eric Matyas",
			filename:"Decisions.mp3",
			//loopStart:0,
			//loopEnd:199,
		},
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
		"Dramatic5"=>{
			title:"Dramatic 5",
			author:"PeriTune",
			filename:"Dramatic5.ogg",
		},
	];

	public static function play(id) {
		var dats:PrxMusicData = MUSIC_DATA.get(id);
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

	public inline static function playSound(nom:String):FlxSound {
		return FlxG.sound.play("assets/sounds/"+nom+".wav");
	}
}

typedef PrxMusicData = {
	title:String,
	author:String,
	filename:String,
	?loopStart:Float,
	?loopEnd:Float,
}