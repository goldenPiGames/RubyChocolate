package puzzle;

import flixel.FlxSprite;

class GridPuzzle extends PuzzleBase {
	var gridWidth:Int;
	var gridHeight:Int;
	var gridScale:Int;
	var gridOffsetX:Int;
	var gridOffsetY:Int;
	var basketSprite:FlxSprite;
	var gridPadOffset:Float = 0;

	public function new() {
		super();
		basketSprite = new FlxSprite();
		add(basketSprite);
	}

	function setGridSize(wide:Int, tall:Int):Void {
		gridWidth = wide;
		gridHeight = tall;
		
	}

	function setGridSizeAndPadding(size:Int, padding:Int = 0) {
		gridScale = size + padding;
		gridOffsetX = 20;
		gridOffsetY = 20;
		gridPadOffset = padding / 2;
		//basketSprite.loadGraphic("assets/images/JewelBasket.png");
		//basketSprite.x = gridOffsetX - 32;
		//basketSprite.y = gridOffsetY - 32;
	}
	
	public inline function getScaleX() {
		return gridScale;
	}
	
	public inline function getScaleY() {
		return gridScale;
	}

	public inline function getSpriteOffsetX() {
		return gridPadOffset;
	}

	public inline function getSpriteOffsetY() {
		return gridPadOffset;
	}

	public inline function gridToPixX(gridX:Int):Float {
		return gridOffsetX + gridScale * gridX;
	}

	public inline function gridToPixY(gridY:Int):Float {
		return gridOffsetY + gridScale * gridY;
	}

	public inline function getBottomY():Float {
		return gridToPixY(gridHeight);
	}
}