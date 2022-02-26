package misc;

import flixel.FlxBasic;
import flixel.group.FlxGroup.FlxTypedGroup;

@:forward
abstract PrxTypedGroup<T:FlxBasic>(FlxTypedGroup<T>) from FlxTypedGroup<T> to FlxTypedGroup<T> {
	public function deletNonexistent():Void {
		var i = 0;
		while (i < this.members.length) {
			if (this.members[i].exists) {
				i++;
			} else {
				this.members.splice(i, 1)[0].destroy();
			}
		}
		//this.members = this.members.filter(deletNonexistentButt);
	}

	/*public function toString():String {
		return this.members.toString();
	}*/
}