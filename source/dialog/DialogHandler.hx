package dialog;

import dialog.DialogLine.DialogLineData;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.text.FlxText;
import misc.PrxMusic;

class DialogHandler extends FlxTypedGroup<FlxBasic> {
	var text:FlxText;
	var header:FlxText;
	var advbg:FlxSprite;
	var backdrop:FlxSprite;
	
	var timeSinceAdvanced:Float = 0;
	
	var lines:Array<DialogLine>;
	var currLine:DialogLine;
	var lineIndex:Int = 0;
	public var isFinished:Bool = false;
	var currPortrait:FlxSprite = null;

	public static inline var ADV_Y = 400;
	public static inline var TEXT_X = 50;
	public static inline var TEXT_WIDTH = 600;

	public function new() {
		super();
		backdrop = new FlxSprite();
		backdrop.visible = false;
		add(backdrop);
		advbg = new FlxSprite(0, ADV_Y, "assets/images/advbg.png");
		add(advbg);
		header = new FlxText(TEXT_X, ADV_Y+10, 300, "Speaker", 20);
		add(header);
		text = new FlxText(TEXT_X, ADV_Y+55, TEXT_WIDTH, "Dialog", 16);
		add(text);
	}

	override function update(elapsed:Float) {
		super.update(elapsed);
		timeSinceAdvanced += elapsed;
	}

	public function play(thelines:Array<DialogLineData>) {
		lines = thelines.map(l->new DialogLine(l));
		lineIndex = -1;
		advanceLine();
	}

	public function advanceLine() {
		timeSinceAdvanced = 0;
		lineIndex++;
		setCurrentLine();
	}

	function setCurrentLine() {
		currLine = lines[lineIndex];
		if (currLine != null) {
			remove(currPortrait);
			currPortrait = currLine.portrait;
			add(currPortrait);
			text.text = currLine.text;
			header.text = currLine.speaker;
			if (currLine.backdrop != null)
				setBackdrop(currLine.backdrop);
			if (currLine.music != null)
				PrxMusic.play(currLine.music);
		} else {
			isFinished = true;
		}
	}

	function setBackdrop(beep:FlxSprite) {
		backdrop.loadGraphicFromSprite(beep);
		backdrop.setGraphicSize(0, FlxG.height);
		backdrop.updateHitbox();
		backdrop.setPosition(0, 0);
		backdrop.visible = true;
	}
}