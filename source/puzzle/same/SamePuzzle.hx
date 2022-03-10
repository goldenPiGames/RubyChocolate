package puzzle.same;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import misc.PrxMisc;

class SamePuzzle extends BlockGridPuzzle<SameBlock> {

	var selected:SameBlock;
	var numQuids:Int;

	public function new() {
		super();
	}

	public override function update(elapsed:Float) {
		super.update(elapsed);
	}

	public override function setupInitial() {
		numQuids = 4;
		super.setupInitial();
		setGridSize(8, 8);
		fillWithNewBlocks();
		//scramble();
	}

	function shuffle() {
		randomizeQuidsSimple(numQuids);
	}

	override function newBlock() {
		return new SameBlock();
	}

	override function setBlockParentSpec(block:SameBlock):Void {
		block.setParentSpec(this);
	}

	public function blockClicked(lick:SameBlock) {
		if (!waitingForPiece) {
			tryRemoving(lick);
		}
	}

	function tryRemoving(start:SameBlock):Bool {
		var numMarked = markFrom(start);
		if (numMarked >= 2) {
			eliminateMarked();
			applyGravity();
		} else {
			PrxMisc.traceAndLog("Not enough to remove");
		}
		unmarkAll();
		return false;
	}

	function markFrom(start:SameBlock):Int {
		start.marked = true;
		var numMarked:Int = 1;
		var newMarked:Bool = true;
		while (newMarked) {
			newMarked = false;
			for (i in 0...gridWidth) {
				for (j in 0...gridHeight-1) {
					if (tryTransferMark(getBlockByGrid(i,j), getBlockByGrid(i,j+1))) {
						newMarked = true;
						numMarked++;
					}
					if (tryTransferMark(getBlockByGrid(i,gridHeight-j-1), getBlockByGrid(i,gridHeight-j-2))) {
						newMarked = true;
						numMarked++;
					}
				}
			}
			for (i in 0...gridWidth-1) {
				for (j in 0...gridHeight) {
					if (tryTransferMark(getBlockByGrid(i,j), getBlockByGrid(i+1,j))) {
						newMarked = true;
						numMarked++;
					}
					if (tryTransferMark(getBlockByGrid(gridWidth-i-1, j), getBlockByGrid(gridWidth-i-2, j))) {
						newMarked = true;
						numMarked++;
					}
				}
			}
		}
		return numMarked;
	}

	inline function tryTransferMark(a:SameBlock, b:SameBlock) {
		return (a != null && b != null && a.marked && !b.marked && a.tryMark(b));
	}

	function eliminateMarked():Void {
		blocks.forEachAlive(eliminateIfMarked);
	}

	function eliminateIfMarked(blap:SameBlock) {
		if (blap.marked) {
			removeBlock(blap);
		}
	}

	function unmarkAll() {
		blocks.forEach(b->b.marked=false);
	}

	override function fillUpBlocks() {
		//fallOffset = gridToPixY(getBottomEmpty()) + 100;
		super.fillUpBlocks();
	}

	override function fillInAt(a:Int, b:Int) {
		var nupe = super.fillInAt(a, b);
		nupe.setQuid(random.int(0, numQuids-1));
		return nupe;
	}
}