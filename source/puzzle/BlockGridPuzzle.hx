package puzzle;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import misc.PrxTypedGroup;

class BlockGridPuzzle<BlockType:PuzzleBlock> extends GridPuzzle {
	var blocks:PrxTypedGroup<BlockType>;
	var blocksByGrid:Array<BlockType>;
	var clickBuffer:Bool;

	public function new() {
		super();
		blocks = new FlxTypedGroup<BlockType>();
		blocksByGrid = new Array<BlockType>();
		add(blocks);
		setupInitial();
	}
	
	public override function update(elapsed:Float) {
		PuzzleBlock.clickBuffer = false;
		super.update(elapsed);
	}

	function setupInitial():Void {

	}

	function insertIntoGrid(block:BlockType, a:Int, b:Int) {
		blocks.add(block);
		block.setGridPosition(a, b);
		blocksByGrid[getIndexByGrid(a, b)] = block;
	}

	function applyGravity() {
		for (i in 0...gridWidth) {
			var jSolid:Int = gridHeight - 1;
			var jYeah:Int = gridHeight - 1;
			while (jYeah > 0) {
				jYeah--;
				if (getBlockByGrid(i, jSolid) != null) {
					jSolid--;
				} else if (getBlockByGrid(i, jYeah) != null) {
					moveToGrid(getBlockByGrid(i, jYeah), i, jSolid);
					jSolid--;
				}
			}
		}
	}

	function removeBlock(block:BlockType) {
		block.eliminate();
		blocksByGrid[getIndexByGrid(block.gridX, block.gridY)] = null;
	}

	function moveToGrid(block:BlockType, a:Int, b:Int) {
		var prevdex:Int = getIndexByGrid(block.gridX, block.gridY);
		if (blocksByGrid[prevdex] == block)
			blocksByGrid[prevdex] = null;
		block.moveGridPosition(a, b);
		blocksByGrid[getIndexByGrid(a, b)] = block;
	}
	
	function getBlock():BlockType {
		var dasboxen = blocks.getFirstAvailable();
		/*if (dasboxen != null) {
			dasboxen.exists = true;
			return dasboxen;
		} else {*/
			dasboxen = newBlock();
			setBlockParent(dasboxen);
			return dasboxen;
		//}
	}

	function newBlock():BlockType {
		return null;
	}

	function randomizeQuidsSimple(numQuids:Int) {
		blocks.forEach(b->b.setQuid(random.int(0, numQuids-1)));
	}

	function setBlockParent(block:BlockType):Void {
		block.setParentGen(this);
		setBlockParentSpec(block);
	}

	function setBlockParentSpec(block:BlockType):Void {

	}

	inline function getIndexByGrid(a:Int, b:Int):Int {
		if (a < 0 || a >= gridWidth || b < 0 || b >= gridHeight)
			return -1;
		else
			return a + b*gridWidth;
	}

	public inline function getBlockByGrid(a:Int, b:Int):BlockType {
		var dex:Int = getIndexByGrid(a, b);
		if (dex < 0)
			return null;
		else
			return blocksByGrid[dex];
	}

	public inline function isGridSameQuid(a:Int, b:Int, q:BlockType):Bool {
		var there:BlockType = getBlockByGrid(a, b);
		if (there == null || there == q)
			return false;
		else
			return there.quid == q.quid;
	}

	function fillWithNewBlocks() {
		for (i in 0...gridWidth) {
			for (j in 0...gridHeight) {
				fillInAt(i, j);
				//insertIntoGrid(newBlock(), i, j);
			}
		}
	}

	function fillUpBlocks() {
		for (i in 0...gridWidth) {
			for (j in 0...gridHeight) {
				if (getBlockByGrid(i, j) == null)
					fillInAt(i, j);
			}
		}
	}

	function fillInAt(a:Int, b:Int):BlockType {
		var cock:BlockType = getBlock();
		insertIntoGrid(cock, a, b);
		return cock;
	}

	function getBottomEmpty():Int {
		for (b in 1...gridHeight+1) {
			for (a in 0...gridWidth) {
				if (getBlockByGrid(a, gridHeight-b) == null)
					return gridHeight - b;
			}
		}
		return -1;
	}

	function clearAllBlocks():Void {
		blocksByGrid = new Array<BlockType>();
		blocks.forEachExists(b->b.clear());
	}
}