package puzzle.same;

class SameBlock extends PuzzleBlock {
	var parentSpec:SamePuzzle;
	public var marked:Bool = false;

	override function loadSprites() {
		loadGraphic("assets/images/ChocolateSquares.png", true, 64, 64);
		animation.add("quid0", [0]);
		animation.add("quid1", [1]);
		animation.add("quid2", [2]);
		animation.add("quid3", [3]);
	}

	public function setParentSpec(theparent:SamePuzzle) {
		parentSpec = theparent;
	}

	override function onClick() {
		parentSpec.blockClicked(this);
	}

	public function tryMark(other:SameBlock):Bool {
		if (quid == other.quid) {
			other.marked = true;
			return true;
		} else {
			return false;
		}
	}
}