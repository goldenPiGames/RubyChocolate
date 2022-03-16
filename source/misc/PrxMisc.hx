package misc;

import flixel.FlxG;

class PrxMisc {
	private static var setup:Bool = false;
	public static function ensureSetup() {
		if (!setup) {
			FlxG.console.registerClass(PrxMusic);
			FlxG.console.registerClass(PrxMisc);
			NGio.setup();
			setup = true;
		}
	}

	public inline static function traceAndLog(sus:Dynamic) {
		FlxG.log.add(sus);
		trace(sus);
	}

	public static function powSign(v:Float, exp:Float):Float {
		var neg:Bool = false;
		if (v < 0) {
			v = -v;
			neg = true;
		}
		v = Math.pow(v, exp);
		if (neg)
			v = -v;
		return v;
	}
}