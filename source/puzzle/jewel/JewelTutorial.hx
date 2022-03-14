package puzzle.jewel;

import dialog.DialogLine;
import dialog.DialogSubState;
import ui.MovesDisplay;

class JewelTutorial extends JewelPuzzle {
	var currentTutIndex:Int;
	var currentTutStageData:JewelTutorialStage;
	var tutStagesData:Array<JewelTutorialStage> = [
		{
			quids : [
				[-2,-2,-2,-2,-2,-2,-2,-2],
				[-2,-2,-2,-2, 0,-2,-2,-2],
				[-2,-2,-2,-2,-2, 0,-2,-2],
				[-2,-2,-2,-2,-2, 0,-2,-2],
				[-2,-2,-2,-2,-2,-2,-2,-2],
				[-2, 2,-2, 2,-2,-2,-2,-2],
				[-2,-2, 2,-2,-2,-2,-2,-2],
				[-2,-2,-2,-2,-2,-2,-2,-2]],
			scoreNeeded : JewelPuzzle.SCORE_3*2,
			dialog:[
				{speaker:"Sophia",portrait:"Sophia",text:"Welcome to the game. Click somewhere on this text box to continue."},
				{speaker:"Agape",portrait:"Agape",text:"Welcome! You'll have fun."},
				{speaker:"Sophia",portrait:"Sophia",text:"The rules are simple. Your goal is to get points by matching 3 of the same jewel in a row (except for those grey stones)."},
				{speaker:"Sophia",portrait:"Sophia",text:"You can click on two adjacent jewels to switch them, but only if switching them would result in a valid match."},
				{speaker:"Sophia",portrait:"Sophia",text:"Try it after this dialog closes."},
			]
		},
		{
			quids : [
				[-2,-2,-2,-2,-2,-2,-2,-2],
				[-2,-2,-2, 4,-2, 4, 4,-2],
				[-2,-2,-2,-2, 4,-2,-2,-2],
				[-2,-2, 5,-2,-2,-2,-2,-2],
				[-2,-2, 5,-2,-2,-2,-2,-2],
				[-2, 5,-2,-2,-2,-2,-2,-2],
				[-2,-2, 5,-2,-2,-2,-2,-2],
				[-2,-2, 5,-2,-2,-2,-2,-2]],
			scoreNeeded : JewelPuzzle.SCORE_4+JewelPuzzle.SCORE_5,
			dialog:[
				{speaker:"Agape",portrait:"Agape",text:"You won't get anywhere good just by playing it easy like that. You need to go for the big moves!"},
				{speaker:"Agape",portrait:"Agape",text:"Matching 4 or 5 in a row gives you way more points than just 3."},
				{speaker:"Sophia",portrait:"Sophia",text:"To be precise, "+JewelPuzzle.SCORE_4+" for quadruples and "+JewelPuzzle.SCORE_5+" for quintuples, as opposed to only "+JewelPuzzle.SCORE_3+" for triples."},
				{speaker:"Agape",portrait:"Agape",text:"Yeah! Go get 'em!"},
			]
		},
		{
			quids : [
				[-2,-2,-2, 3,-2,-2,-2,-2],
				[ 3,-2, 1, 1,-2,-2,-2,-2],
				[-2, 1,-2, 3,-2,-2,-2,-2],
				[-2,-2,-2,-2,-2, 4,-2,-2],
				[-2,-2,-2,-2, 2, 4,-2,-2],
				[-2,-2,-2,-2, 4, 2,-2,-2],
				[-2,-2,-2,-2, 2,-2,-2,-2],
				[-2,-2,-2,-2,-2,-2,-2,-2]],
			scoreNeeded : JewelPuzzle.SCORE_3*4+JewelPuzzle.SCORE_COMBO*2,
			dialog:[
				{speaker:"Sophia",portrait:"Sophia",text:"4s and 5s aren't the only ways to acquire additional points. Combos also have value."},
				{speaker:"Sophia",portrait:"Sophia",text:"If you incur chain reactions of multiple matches, you will earn the score for each match as well as a bonus of "+JewelPuzzle.SCORE_COMBO+" for each match beyond the first."},
			]
		},
	];
	static inline var FREE_MOVES = 15;
	static inline var FREE_SCORE_NEEDED = 2000;
	final FREE_DIALOG:Array<DialogLineData> = [
		{speaker:"Sophia",portrait:"Sophia",text:"I hope that you sufficiently understand what you must do now."},
		{speaker:"Agape",portrait:"Agape",text:"Oh, but before we start! Remember that things are always moving along."},
		{speaker:"Sophia",portrait:"Sophia",text:"Every "+JewelPuzzle.CLEAR_BOTTOM_RATE+" turns, the bottom row will be cleared and a new row will fall in from the top. Be careful as this may ruin any combos you may be setting up."},
		{speaker:"Agape",portrait:"Agape",text:"But just imagine all the possibilities it could bring in from the top!"},
		{speaker:"Sophia",portrait:"Sophia",text:"Statistically, random new blocks are more likely to contain valuable matches and combos that that which has already had its opportunities exhausted."},
		{speaker:"Agape",portrait:"Agape",text:"Plus, if you really want to move things along, you can click that button down there that this text box is in front of right now, but it'll take a turn."},
	];
	var gottaStartDialog:Array<DialogLineData>;
	var tutorialActive:Bool = true;

	override function setInitialValues() {
		setNumMoves(42069);
		currentTutIndex = 0;
		setCurrentTutStage();
		numQuids = 6;//a memorial to noon, march 14th 2022 when i spent half an hour trying to figure out why it froze in an infinite loop at the beginning of the free section only to realize that i never set numQuids, causing it to get into an infinite loop when filling bacause it was repeatedly trying to add a single quid everywhere
	}

	override function update(elapsed:Float) {
		super.update(elapsed);
		if (!waitingForPiece && gottaStartDialog != null) {
			startDialog();
		}
	}

	function nextTutStage() {
		currentTutIndex ++;
		if (currentTutIndex >= tutStagesData.length) {
			finishTutorial();
		} else {
			setCurrentTutStage();
		}
		shuffle();
	}
	
	function setCurrentTutStage() {
		currentTutStageData = tutStagesData[currentTutIndex];
		setScoreNeeded(currentTutStageData.scoreNeeded);
		gottaStartDialog = currentTutStageData.dialog;
	}

	function finishTutorial() {
		tutorialActive = false;
		setNumMoves(FREE_MOVES);
		setScoreNeeded(FREE_SCORE_NEEDED);
		gottaStartDialog = FREE_DIALOG;
	}

	override function endCombo() {
		super.endCombo();
		if (tutorialActive && score >= scoreNeeded) {
			nextTutStage();
		}
	}

	override function fillWithNewBlocks() {
		setScore(0);
		if (tutorialActive) {
			var quids:Array<Array<Int>> = currentTutStageData.quids;
			var b:JewelBlock;
			for (i in 0...gridWidth) {
				for (j in 0...gridHeight) {
					b = fillInAt(i, j);
					b.setQuid(quids[i][j]);
				}
			}
		} else
			super.fillWithNewBlocks();
	}

	override function fillInAt(a:Int, b:Int) {
		if (tutorialActive) {
			var nupe = getBlock();
			nupe.setQuid(JewelBlock.QUID_TRASH);
			insertIntoGrid(nupe, a, b);
			nupe.animFallFromTop(fallOffset);
			//trace(fallOffset);
			return nupe;
		} else
			return super.fillInAt(a, b);
	}

	override function setMovesDisplay(m:MovesDisplay) {
		movesDisplay = m;
		movesDisplay.setUnlimited();
	}

	override function tookMove() {
		if (!tutorialActive)
			super.tookMove();
	}

	function startDialog() {
		var sus:DialogSubState = new DialogSubState();
		state.openSubState(sus);
		sus.dialog.play(gottaStartDialog);
		gottaStartDialog = null;
	}

	override function maybeDrop() {
		if (tutorialActive) {
			shuffle();
		} else
			super.maybeDrop();
	}
}

typedef JewelTutorialStage = {
	quids:Array<Array<Int>>,
	scoreNeeded:Int,
	dialog:Array<DialogLineData>
}