package states;

import dialog.DialogSubState;
import flixel.FlxState;
import misc.PrxMisc;

class PrxState extends FlxState {
	override function create() {
		super.create();
		PrxMisc.ensureSetup();
	}
	
	public function playCutscene(lithp) {
		var sus:DialogSubState = new DialogSubState(this);
		sus.dialog.play(lithp);
		openSubState(sus);
	}

	public function cutsceneOver() {

	}
}