package puzzle.jewel;

class JewelBlock extends PuzzleBlock {
	var parentSpec:JewelPuzzle;
	public static inline var QUID_TRASH = -2;
	public static inline var QUID_POISON = -1;

	override function loadSprites() {
		loadGraphic("assets/images/Candies.png", true, 64, 64);
		//loadGraphic("assets/images/Jewels.png", true, 64, 64);
		animation.add("quid0", [1]);
		animation.add("quid1", [2]);
		animation.add("quid2", [3]);
		animation.add("quid3", [4]);
		animation.add("quid4", [5]);
		animation.add("quid5", [6]);
		//animation.add("quid6", [7]);
		animation.add("quid"+QUID_TRASH, [0]);
		animation.add("quid"+QUID_POISON, [7]);
	}

	public function setParentSpec(theparent:JewelPuzzle) {
		parentSpec = theparent;
	}

	override function onClick() {
		parentSpec.jewelClicked(this);
	}

	public function couldMatchAt(hypx:Int, hypy:Int):Bool {
		if (isTrash())
			return false;
		var left = parentSpec.isGridSameQuid(hypx - 1, hypy, this);
		var right = parentSpec.isGridSameQuid(hypx + 1, hypy, this);
		if ((left && right) || (left && parentSpec.isGridSameQuid(hypx - 2, hypy, this))
				|| right && parentSpec.isGridSameQuid(hypx + 2, hypy, this))
			return true;
		var up = parentSpec.isGridSameQuid(hypx, hypy - 1, this);
		var down = parentSpec.isGridSameQuid(hypx, hypy + 1, this);
		return (up && down) || (up && parentSpec.isGridSameQuid(hypx, hypy - 2, this))
				|| (down && parentSpec.isGridSameQuid(hypx, hypy + 2, this));
	}

	public inline function isTrash():Bool {
		return quid == QUID_TRASH;
	}

	public inline function isPoison():Bool {
		return quid == QUID_POISON;
	}
}