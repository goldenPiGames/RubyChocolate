package puzzle;

class GridPuzzle extends PuzzleBase {
	var gridWidth:Int;
	var gridHeight:Int;
	var gridScale:Int;
	var gridOffsetX:Int;
	var gridOffsetY:Int;


	function setGridSize(wide:Int, tall:Int):Void {
		gridWidth = wide;
		gridHeight = tall;
		gridScale = 64;
		gridOffsetX = 20;
		gridOffsetY = 20;
	}
	
	public inline function getScaleX() {
		return gridScale;
	}
	
	public inline function getScaleY() {
		return gridScale;
	}

	public inline function gridToPixX(gridX:Int):Float {
		return gridOffsetX + gridScale * gridX;
	}

	public inline function gridToPixY(gridY:Int):Float {
		return gridOffsetY + gridScale * gridY;
	}
}