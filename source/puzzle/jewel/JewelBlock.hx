package puzzle.jewel;

class JewelBlock extends PuzzleBlock {
	var parentSpec:JewelPuzzle;

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