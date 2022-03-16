package misc;

import flixel.FlxG;
import io.newgrounds.NG;
import io.newgrounds.crypto.Cipher;
import io.newgrounds.crypto.EncryptionFormat;
import io.newgrounds.crypto.Rc4;

class NGio {
	public static function setup() {
		FlxG.console.registerClass(NGio);
		NG.createAndCheckSession(NGsecret.id);
		NG.core.initEncryption(NGsecret.key);
		if (!NG.core.attemptingLogin) NG.core.requestLogin(onNGLogin);
		else NG.core.onLogin.add(onNGLogin);
		FlxG.console.registerClass(NG);
	}

	static function onNGLogin() {
		NG.core.requestMedals();
	}

	public static function submitStagePassed() {
		switch (Passing.level) {
			case 0: unlockMedal(68153);//"God Hearts"
			case 1: unlockMedal(68147);//"Young Hearts"
			case 2: unlockMedal(68148);//"Old Hearts"
			case 3: unlockMedal(68149);//"Opposing Hearts"
		}
	}

	static function unlockMedal(id:Int) {
		trace("trying to unlock medal #"+id);
		if (NG.core.medals != null) {
			var medal =  NG.core.medals.get(id);
			if (!medal.unlocked) {
				medal.onUnlock.add(function ():Void {afterMedalUnlocked(medal.name);});
				medal.sendUnlock();
			}
		} else {
			trace("medals are null");
		}
	}

	static function afterMedalUnlocked(nom:String) {
		trace(nom+" unlocked");
	}
}