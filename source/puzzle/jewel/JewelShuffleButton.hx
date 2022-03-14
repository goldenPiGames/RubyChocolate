package puzzle.jewel;

import ui.PrxButton;

class JewelShuffleButton extends PrxButton {
	var parent:JewelPuzzle;

	public function new(x:Float, y:Float, theparent:JewelPuzzle) {
		super(x, y, "JewelShuffle", maybeShuffle);
		parent = theparent;
	}

	function maybeShuffle() {
		parent.maybeShuffle();
	}
}

class JewelDropButton extends PrxButton {
	var parent:JewelPuzzle;

	public function new(x:Float, y:Float, theparent:JewelPuzzle) {
		super(x, y, "JewelDrop", maybeDrop);
		parent = theparent;
	}

	function maybeDrop() {
		parent.maybeDrop();
	}
}