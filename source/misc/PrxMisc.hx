package misc;

import flixel.FlxG;

class PrxMisc {
	

	public inline static function traceAndLog(sus:Dynamic) {
		FlxG.log.add(sus);
		trace(sus);
	}
}