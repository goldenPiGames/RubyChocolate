package states;

import dialog.Cutscenes;
import dialog.DialogSubState;
import effects.ScoreFloater;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import gameui.GameResults;
import gameui.GodCutin;
import misc.PrxMusic;
import misc.PrxTypedGroup;
import puzzle.BlockGridPuzzle;
import puzzle.PuzzleBase;
import puzzle.jewel.JewelPuzzle;
import puzzle.jewel.JewelPuzzlePoison;
import puzzle.jewel.JewelPuzzleTrash;
import puzzle.jewel.JewelTutorial;
import puzzle.same.SamePuzzle;
import realanim.GamerVsWeebAnim;
import realanim.OldPeopleAnim;
import realanim.RealAnim;
import realanim.RevolutionAnim;
import realanim.TestAnim;
import ui.MovesDisplay;
import ui.PrxButton;
import ui.ScoreDisplay;

class PlayState extends PrxState {
	var fullBackground:FlxSprite;
	var puzzle:PuzzleBase;
	var results:GameResults;
	var realanim:RealAnim;
	var scoreDisplay:ScoreDisplay;
	var movesDisplay:MovesDisplay;
	var scoreFloaters:PrxTypedGroup<ScoreFloater>;
	var options:PrxTypedGroup<PrxButton>;
	var cutinAgape:GodCutin;
	var cutinSophia:GodCutin;

	override public function create() {
		super.create();
		switch (Passing.puzzle + Passing.level) {
			case "jewel0": puzzle = new JewelTutorial();
			case "jewel1": puzzle = new JewelPuzzle();
			case "jewel2": puzzle = new JewelPuzzleTrash();
			case "jewel3": puzzle = new JewelPuzzlePoison();
			case "same0": puzzle = new SamePuzzle(); realanim = new TestAnim();
		}
		playIntroScene();
		puzzle.setState(this);
		add(puzzle);
		realanim.setState(this);
		add(realanim);
		puzzle.setRealAnim(realanim);
		scoreDisplay = new ScoreDisplay(620, 180, 300, 24);
		add(scoreDisplay);
		puzzle.setScoreDisplay(scoreDisplay);
		movesDisplay = new MovesDisplay(620, 240, 300, 24);
		add(movesDisplay);
		puzzle.setMovesDisplay(movesDisplay);
		scoreFloaters = new FlxTypedGroup<ScoreFloater>();
		add(scoreFloaters);
		options = new FlxTypedGroup<PrxButton>();
		add(options);
		options.add(new PrxButton(FlxG.width-67, 0, "Back", exitToMenu));
		cutinAgape = new GodCutin(GodCutin.CHAR_AGAPE);
		add(cutinAgape);
		cutinSophia = new GodCutin(GodCutin.CHAR_SOPHIA);
		add(cutinSophia);
		puzzle.setCutins(cutinAgape, cutinSophia);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}

	public function addScoreFloater(amount:Int, location:FlxPoint) {
		scoreFloaters.deletNonexistent();
		scoreFloaters.add(new ScoreFloater(location.x, location.y, amount));
	}

	function exitToMenu() {
		FlxG.switchState(new MainMenu());
	}

	public function puzzleOver() {
		puzzle.active = false;
		results = new GameResults(puzzle);
		add(results);
		playOutroScene(results.success);
	}

	public function playIntroScene() {
		var backName:String = null;
		switch (Passing.scene) {
			case "LoveAndLogic": realanim = new TestAnim(); PrxMusic.play("CoffeeLounge");
			case "GamerVsWeeb": realanim = new GamerVsWeebAnim(); playCutscene(Cutscenes.GAMERVSWEEB_INTRO); backName = "FrikDonaldsMuted.png";
			case "OldPeople": realanim = new OldPeopleAnim(); playCutscene(Cutscenes.OLDPEOPLE_INTRO); backName = "Sunset.png";
			case "Revolution": realanim = new RevolutionAnim(); playCutscene(Cutscenes.REVOLUTION_INTRO); backName = "GreatLeader.png";
			default: return;
		}
		if (backName != null) {
			fullBackground = new FlxSprite(0, 0, "assets/images/backdrops/"+backName);
			fullBackground.setGraphicSize(0, FlxG.height);
			fullBackground.updateHitbox();
			fullBackground.setPosition(0, 0);
			add(fullBackground);
		}
	}

	public function playOutroScene(succ:Bool) {
		switch (Passing.scene) {
			case "GamerVsWeeb": playCutscene(succ?Cutscenes.GAMERVSWEEB_OUTRO_GOOD:Cutscenes.GAMERVSWEEB_OUTRO_BAD);
			case "OldPeople": playCutscene(succ?Cutscenes.OLDPEOPLE_OUTRO_GOOD:Cutscenes.OLDPEOPLE_OUTRO_BAD);
			case "Revolution": playCutscene(succ?Cutscenes.REVOLUTION_OUTRO_GOOD:Cutscenes.REVOLUTION_OUTRO_BAD);
			default: return;
		}
	}

	override function playCutscene(lithp) {
		super.playCutscene(lithp);
		realanim.visible = false;
	}

	override function cutsceneOver() {
		realanim.visible = true;
	}
}
