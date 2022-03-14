package misc;

import flixel.FlxG;
import io.newgrounds.NG;

class NGio {
	public static function setup() {
		FlxG.console.registerClass(NGio);
		NG.create(NGsecret.id);
	}

	public static function submitStagePassed() {
		switch (Passing.level) {
			case 1: unlockMedal(68147);//"Young Hearts"
			case 2: unlockMedal(68148);//"Old Hearts";
			case 3: unlockMedal(68149);//"Opposing Hearts"
		}
	}

	static function unlockMedal(id) {
		if (NG.core.medals != null) {
			var medal =  NG.core.medals.get(id);
			if (!medal.unlocked) {
				medal.onUnlock.add(function ():Void {afterMedalUnlocked(medal.name);});
				medal.sendUnlock();
			}
		}
	}

	static function afterMedalUnlocked(nom:String) {
		trace(nom+" unlocked");
	}
}