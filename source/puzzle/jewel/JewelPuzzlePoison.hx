package puzzle.jewel;

class JewelPuzzlePoison extends JewelPuzzle {
	public static inline var SCORE_POISON:Int = -1600;
	public static inline var POISON_CHANCE:Float = 11;
	public static inline var SCORE_NEEDED = 10000;

	override function setInitialValues() {
		setNumMoves(JewelPuzzle.NUM_MOVES);
		numQuids = 5;
		setScoreNeeded(SCORE_NEEDED);
	}

	override function getRandomQuid():Int {
//		return -1;
		if (random.bool(POISON_CHANCE))
			return JewelBlock.QUID_POISON;
		else
			return super.getRandomQuid();
	}
}