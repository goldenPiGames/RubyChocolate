package puzzle.jewel;

class JewelPuzzlePoison extends JewelPuzzle {
	public static inline var SCORE_POISON:Int = -2000;

	override function getRandomQuid():Int {
		return random.int(-1, numQuids-1);
	}
}