package puzzle.jewel;

import flixel.FlxG;

class JewelPuzzleTrash extends JewelPuzzle {
	override function fillInAt(a:Int, b:Int):JewelBlock {
		var nupe = super.fillInAt(a, b);
		if (FlxG.random.bool(10))
			nupe.setQuid(JewelBlock.QUID_TRASH);
		return nupe;
	}
}