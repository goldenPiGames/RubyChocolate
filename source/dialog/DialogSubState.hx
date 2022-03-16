package dialog;

import flixel.FlxG;
import flixel.FlxSubState;
import states.PrxState;

class DialogSubState extends FlxSubState {
	public var dialog:DialogHandler;
	var parent:PrxState;

	public function new(theparent:PrxState) {
		super();
		parent = theparent;
		dialog = new DialogHandler();//this is probably supposed to go in create but eh order
	}

	override function create() {
		super.create();
		add(dialog);
	}

	override function update(elapsed:Float) {
		super.update(elapsed);
		if (dialog.isFinished) {
			close();
			parent.cutsceneOver();
		} else if (FlxG.mouse.justPressed && FlxG.mouse.screenY > DialogHandler.ADV_Y) {
			dialog.advanceLine();
		}
	}
}