package dialog;

import flixel.FlxG;
import flixel.FlxSubState;

class DialogSubState extends FlxSubState {
	public var dialog:DialogHandler;

	public function new() {
		super();
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
		} else if (FlxG.mouse.justPressed && FlxG.mouse.screenY > DialogHandler.ADV_Y) {
			dialog.advanceLine();
		}
	}
}