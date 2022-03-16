package puzzle.jewel;

import flixel.FlxG;

class JewelPuzzleTrash extends JewelPuzzle {
	var enableTrash:Bool = true;

	static inline var TRASH_CHANCE = 5.55;
	static inline var TRASH_STARTING = 8;
	public static inline var SCORE_NEEDED = 9000;

	override function shuffle() {
		enableTrash = false;
		super.shuffle();
		enableTrash = true;
		for (i in 0...gridHeight) {
			getBlockByGrid(random.int(0, gridWidth-1), i).setQuid(JewelBlock.QUID_TRASH);
		}
		/*
		var placed:Int = 0;
		var loops:Int = 0;
		var b:JewelBlock;
		while (placed < TRASH_STARTING && loops < 69) {
			b = getBlockByIndex(random.int(0, gridWidth*gridHeight-1));
			if (!b.isTrash()) {
				b.setQuid(JewelBlock.QUID_TRASH);
				placed++;
			}
			loops++;
		}*/
	}
	
	override function fillInAt(a:Int, b:Int):JewelBlock {
		var nupe = super.fillInAt(a, b);
		if (enableTrash && random.bool(TRASH_CHANCE))
			nupe.setQuid(JewelBlock.QUID_TRASH);
		return nupe;
	}

	override function setInitialValues() {
		setNumMoves(JewelPuzzle.NUM_MOVES);
		numQuids = 6;
		setScoreNeeded(SCORE_NEEDED);
	}
}