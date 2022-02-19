package puzzle.jewel;

import flixel.FlxG;
import flixel.FlxSprite;
import haxe.display.Display.Package;

class JewelPuzzle extends BlockGridPuzzle<JewelBlock> {

	var selected:JewelBlock;
	var selector:JewelSelector;
	var gottaDoMatches:Bool;
	var comboMatch:Int;
	var numQuids:Int;
	var fallOffset:Float;

	public function new() {
		super();
		selector = new JewelSelector();
		add(selector);
		gottaDoMatches = false;
		comboMatch = 0;
	}

	public override function update(elapsed:Float) {
		super.update(elapsed);
		if (!waitingForPiece && gottaDoMatches) {
			doMatches();
		}
	}

	public override function setupInitial() {
		numQuids = 6;
		super.setupInitial();
		setGridSize(8, 8);
		fillWithNewBlocks();
		scramble();
	}

	override function scramble() {
		randomizeQuidsSimple(numQuids);
		var failsafe:Int = 0;
		while (getAllMatches().length > 0 && failsafe < 14) {
			failsafe++;
			randomizeQuidsSimple(numQuids);
		}
		trace(failsafe);
	}

	override function newBlock() {
		return new JewelBlock();
	}

	override function setBlockParentSpec(block:JewelBlock):Void {
		block.setParentSpec(this);
	}

	function getAllMatches():Array<JewelPuzzleMatch> {
		var matches:Array<JewelPuzzleMatch> = new Array<JewelPuzzleMatch>();
		var streak:Array<JewelBlock>;
		for (i in 0...gridWidth) {
			streak = new Array<JewelBlock>();
			for (j in 0...gridHeight) {
				var disjuan:JewelBlock = getBlockByGrid(i, j);
				if (disjuan == null || (streak.length > 0 && disjuan.quid != streak[0].quid)) {
					if (streak.length >= 3) {
						matches.push(streak);
					}
					streak = new Array<JewelBlock>();
				}
				if (disjuan != null)
					streak.push(disjuan);
			}
			if (streak.length >= 3)
				matches.push(streak);
		}
		for (i in 0...gridHeight) {
			streak = new Array<JewelBlock>();
			for (j in 0...gridWidth) {
				var disjuan:JewelBlock = getBlockByGrid(j, i);
				if (disjuan == null || (streak.length > 0 && disjuan.quid != streak[0].quid)) {
					if (streak.length >= 3) {
						matches.push(streak);
					}
					streak = new Array<JewelBlock>();
				}
				if (disjuan != null)
					streak.push(disjuan);
			}
			if (streak.length >= 3)
				matches.push(streak);
		}
		return matches;
	}

	function doMatches():Void {
		var matches:Array<JewelPuzzleMatch> = getAllMatches();
		if (matches.length > 0) {
			for (match in matches) {
				scorePoints(match.getScore());
				comboMatch += 1;
				for (blim in match) {
					removeBlock(blim);
				}
			}
			gottaDoMatches = true;
			waitingForPiece = true;
			applyGravity();
		} else {
			endCombo();
			gottaDoMatches = false;
		}
	}

	public function jewelClicked(lick:JewelBlock) {
		if (lick == selected) {
			select(null);
		} else if (selected == null) {
			select(lick);
		} else if (areAdjacent(lick, selected)) {
			trySwapping(lick, selected);
			select(null);
		} else {
			select(lick);
		}
	}

	function select(blep:JewelBlock) {
		selected = blep;
		selector.moveTo(blep);
	}

	inline function areAdjacent(a:JewelBlock, b:JewelBlock):Bool {
		return (a.gridX == b.gridX && (a.gridY == b.gridY - 1 || a.gridY == b.gridY + 1) ||
				a.gridY == b.gridY && (a.gridX == b.gridX - 1 || a.gridX == b.gridX + 1));
	}

	function trySwapping(a:JewelBlock, b:JewelBlock):Bool {
		if (canSwap(a, b)) {
			swap(a, b);
			return true;
		} else {
			return false;
		}
	}

	function swap(a:JewelBlock, b:JewelBlock):Void {
		var bx:Int = b.gridX;
		var by:Int = b.gridY;
		moveToGrid(b, a.gridX, a.gridY);
		moveToGrid(a, bx, by);
		gottaDoMatches = true;
		waitingForPiece = true;
	}

	function canSwap(a:JewelBlock, b:JewelBlock):Bool {
		if (a.quid == b.quid) {
			return false;
		}
		return a.couldMatchAt(b.gridX, b.gridY) || b.couldMatchAt(a.gridX, a.gridY);
	}

	function endCombo() {
		if (comboMatch > 1) {
			scorePoints((comboMatch - 1) * comboMatch * 100);
		}
		comboMatch = 0;
		fillUpBlocks();
	}

	override function fillUpBlocks() {
		fallOffset = gridToPixY(getBottomEmpty()) + 100;
		super.fillUpBlocks();
	}

	override function fillInAt(a:Int, b:Int) {
		var nupe = getBlock();
		var lastQuid = random.int(0, numQuids-1);
		nupe.setQuid((lastQuid + 1) % numQuids);
		while (nupe.couldMatchAt(a, b) && nupe.quid != lastQuid) {
			nupe.setQuid((nupe.quid + 1) % numQuids);
		}
		nupe.setQuid(nupe.quid);
		insertIntoGrid(nupe, a, b);
		nupe.animFallFromTop(fallOffset);
	}
}

class JewelSelector extends FlxSprite {
	public function new() {
		super();
		loadGraphic("assets/images/JewelSelector.png", true, 64, 64);
		animation.add("select", [0]);
		setSize(64, 64);
		visible = false;
	}

	public function moveTo(target:JewelBlock) {
		if (target != null) {
			visible = true;
			setPosition(target.x, target.y);
		} else {
			visible = false;
		}
	}
}

@:forward
abstract JewelPuzzleMatch(Array<JewelBlock>) from Array<JewelBlock> to Array<JewelBlock> {
	public function getScore():Int {
		return this.length * 300 - 800;
	}
}