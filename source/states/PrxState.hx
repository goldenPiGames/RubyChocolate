package states;

import flixel.FlxState;
import misc.PrxMisc;

class PrxState extends FlxState {
	override function create() {
		super.create();
		PrxMisc.ensureSetup();
	}
}