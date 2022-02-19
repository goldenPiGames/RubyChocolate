package puzzle;

import flixel.FlxG;
import flixel.FlxSprite;
import puzzle.BlockGridPuzzle;

class PuzzleBlock extends FlxSprite {
	var goalX:Float;
	var goalY:Float;
	public var gridX:Int;
	public var gridY:Int;
	public var quid:Int;
	public var parentGen:GridPuzzle;
	public static var clickBuffer:Bool;
	public var moving:Bool = false;
	var speed:Float = 420;
	//var parent:BlockGridPuzzle<PuzzleBlock>;

	public function new() {
		super();
		loadSprites();
	}

	function loadSprites() {
		loadGraphic("assets/images/Blocks.png", true, 64, 64);
		animation.add("quid0", [0]);
		animation.add("quid1", [1]);
		animation.add("quid2", [2]);
		animation.add("quid3", [3]);
		animation.add("quid4", [4]);
		animation.add("quid5", [5]);
		animation.add("quid6", [6]);
	}

	public override function update(elapsed:Float) {
		super.update(elapsed);
		if (moving) {
			parentGen.indicateMoveWait();
			var step:Float = speed * elapsed;
			if (x < goalX) {
				x = Math.min(x + step, goalX);
			} else if (x > goalX) {
				x = Math.max(x - step, goalX);
			}
			if (y < goalY) {
				y = Math.min(y + step, goalY);
			} else if (y > goalY) {
				y = Math.max(y - step, goalY);
			}
			if (goalX == x && goalY == y) {
				moving = false;
			}
		} else if (!clickBuffer && FlxG.mouse.justPressed && FlxG.mouse.overlaps(this)) {
			clickBuffer = true;
			this.onClick();
		}
	}

	function onClick():Void {
		
	}

	public function setQuid(to:Int) {
		quid = to;
		animation.play("quid"+quid);
	}

	public function setParentGen(theparent:GridPuzzle) {
		parentGen = theparent;
	}

	public function moveGridPosition(a:Int, b:Int):Void {
		gridX = a;
		gridY = b;
		goalX = parentGen.gridToPixX(a);
		goalY = parentGen.gridToPixY(b);
		moving = true;
	}

	public function setGridPosition(a:Int, b:Int):Void {
		gridX = a;
		gridY = b;
		snapPositionToGrid();
	}

	public function snapPositionToGrid():Void {
		setSize(parentGen.getScaleX(), parentGen.getScaleY());
		x = parentGen.gridToPixX(gridX);
		y = parentGen.gridToPixY(gridY);
	}

	public function animFallFromTop(offset:Float) {
		goalX = parentGen.gridToPixX(gridX);
		goalY = parentGen.gridToPixY(gridY);
		x = goalX;
		y = goalY - offset;
		moving = true;
	}

	public override function toString():String {
		return "("+gridX+","+gridY+":"+quid+")";
	}

	public function eliminate():Void {
		exists = false;
	}
}