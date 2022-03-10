package misc;

import flixel.FlxG;

class PrxMisc {
	private static var setup:Bool = false;
	public static function ensureSetup() {
		if (!setup) {
			FlxG.console.registerClass(PrxMusic);
			setup = true;
		}
	}

	public inline static function traceAndLog(sus:Dynamic) {
		FlxG.log.add(sus);
		trace(sus);
	}
}