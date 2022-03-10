package puzzle.jewel;

import ui.MovesDisplay;

class JewelTutorial extends JewelPuzzle {
	var currentTutIndex:Int;
	var currentTutStageData:JewelTutorialStage;
	var tutStagesData:Array<JewelTutorialStage> = [
		{
			quids : [
				[-1,-1,-1,-1,-1,-1,-1,-1],
				[-1,-1,-1,-1, 0,-1,-1,-1],
				[-1,-1,-1,-1,-1, 0,-1,-1],
				[-1,-1,-1,-1,-1, 0,-1,-1],
				[-1,-1,-1,-1,-1,-1,-1,-1],
				[-1, 2,-1, 2,-1,-1,-1,-1],
				[-1,-1, 2,-1,-1,-1,-1,-1],
				[-1,-1,-1,-1,-1,-1,-1,-1]],
			scoreRequired : JewelPuzzle.SCORE_3*2
		},
		{
			quids : [
				[-1,-1,-1,-1,-1,-1,-1,-1],
				[-1,-1,-1, 4,-1, 4, 4,-1],
				[-1,-1,-1,-1, 4,-1,-1,-1],
				[-1,-1, 5,-1,-1,-1,-1,-1],
				[-1,-1, 5,-1,-1,-1,-1,-1],
				[-1, 5,-1,-1,-1,-1,-1,-1],
				[-1,-1, 5,-1,-1,-1,-1,-1],
				[-1,-1, 5,-1,-1,-1,-1,-1]],
			scoreRequired : JewelPuzzle.SCORE_4+JewelPuzzle.SCORE_5
		},
		{
			quids : [
				[-1,-1,-1, 3,-1,-1,-1,-1],
				[ 3,-1, 1, 1,-1,-1,-1,-1],
				[-1, 1,-1, 3,-1,-1,-1,-1],
				[-1,-1,-1,-1,-1, 4,-1,-1],
				[-1,-1,-1,-1, 2, 4,-1,-1],
				[-1,-1,-1,-1, 4, 2,-1,-1],
				[-1,-1,-1,-1, 2,-1,-1,-1],
				[-1,-1,-1,-1,-1,-1,-1,-1]],
			scoreRequired : JewelPuzzle.SCORE_3*4+JewelPuzzle.SCORE_COMBO*2
		},
	];

	override function setInitialCounters() {
		setNumMoves(42069);
		currentTutIndex = 0;
		setCurrentTutStage();
	}

	function nextTutStage() {
		currentTutIndex ++;
		setCurrentTutStage();
		if (currentTutIndex >= tutStagesData.length) {
			finishTutorial();
		} else {
			shuffle();
		}
	}
	
	function setCurrentTutStage() {
		currentTutStageData = tutStagesData[currentTutIndex];
	}

	override function endCombo() {
		super.endCombo();
		if (score >= currentTutStageData.scoreRequired) {
			nextTutStage();
		}
	}

	override function fillWithNewBlocks() {
		setScore(0);
		var quids:Array<Array<Int>> = currentTutStageData.quids;
		var b:JewelBlock;
		for (i in 0...gridWidth) {
			for (j in 0...gridHeight) {
				b = fillInAt(i, j);
				b.setQuid(quids[i][j]);
			}
		}
	}

	override function fillInAt(a:Int, b:Int) {
		var nupe = getBlock();
		nupe.setQuid(JewelBlock.QUID_TRASH);
		insertIntoGrid(nupe, a, b);
		nupe.animFallFromTop(fallOffset);
		//trace(fallOffset);
		return nupe;
	}

	function finishTutorial() {
		state.puzzleOver();
	}

	override function setMovesDisplay(m:MovesDisplay) {
		movesDisplay = m;
		movesDisplay.setUnlimited();
	}

	override function tookMove() {
		
	}
}

typedef JewelTutorialStage = {
	quids:Array<Array<Int>>,
	scoreRequired:Int,
}