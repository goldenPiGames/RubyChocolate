package puzzle.jewel;

class JewelBlock extends PuzzleBlock {
	var parentSpec:JewelPuzzle;

	override function loadSprites() {
		loadGraphic("assets/images/Jewels.png", true, 64, 64);
		animation.add("quid0", [0]);
		animation.add("quid1", [1]);
		animation.add("quid2", [2]);
		animation.add("quid3", [3]);
		animation.add("quid4", [4]);
		animation.add("quid5", [5]);
		animation.add("quid6", [6]);
	}

	public function setParentSpec(theparent:JewelPuzzle) {
		parentSpec = theparent;
	}

	override function onClick() {
		parentSpec.jewelClicked(this);
	}

	public function couldMatchAt(hypx:Int, hypy:Int):Bool {
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
}