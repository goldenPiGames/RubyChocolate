package dialog;

import dialog.DialogLine.DialogLineData;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;

class DialogHandler extends FlxTypedGroup<FlxBasic> {
	var text:FlxText;
	var header:FlxText;
	var advbg:FlxSprite;
	
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
		} else {
			isFinished = true;
		}
	}
}