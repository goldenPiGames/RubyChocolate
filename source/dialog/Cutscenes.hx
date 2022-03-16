package dialog;

import dialog.DialogLine.DialogLineData;

class Cutscenes {
	public static var GAMERVSWEEB_INTRO:CutsceneData = [
		{speaker:"Ellen",text:"i liek anime :3",music:"Rift",backdrop:"FrikDonalds.png"},
		{speaker:"Keith",text:"GAMERS DON'T DIE THEY RESPAWN"},
		{speaker:"Ellen",text:"miku miku miiiii :3"},
		{speaker:"Keith",text:"YOU'D BETTER NOT MESS WITH ME I'M CLOSE TO LEVELING UP AND YOU LOOK LIKE JUST ENOUGH XP"},
		{speaker:"Agape",portrait:"AgapeO",text:"Oh, how cute! I'm sure they'll get together great with our help."},
		{speaker:"Sophia",portrait:"SophiaD",text:"Of course."},
	];
	public static var GAMERVSWEEB_OUTRO_GOOD:CutsceneData = [
		{speaker:"Keith",text:"Do you believe that love can bloom on the battlefield?"},
		{speaker:"Ellen",text:"yeh. lets play animal crossing together :3"},
		{speaker:"Keith",text:"OK"},
	];
	public static var GAMERVSWEEB_OUTRO_BAD:CutsceneData = [
		{speaker:"Keith",text:"GET NOSCOPED SCRUBNOOB"},
		{speaker:"Ellen",text:"you are a butt >:o"},
		{speaker:"Keith",text:"*does default dance*"},
		{speaker:"Ellen",portrait:"Nothing",text:"*dies instantly*"},
	];
	public static var OLDPEOPLE_INTRO:CutsceneData = [//https://pxhere.com/en/photo/1631139
		{speaker:"Edna",text:"What a beautiful way to start the day! The pink sky and the faint rays of the sun makes me think of our youth.",backdrop:"PinkSky.jpg",music:"AfternoonDaydream"},
		{speaker:"Phil",text:"Those times when we woke up next to each other, embracing the scents of our bare skins, that were yet untouched by the wrinkle of time?"},
		{speaker:"Edna",text:"Yes. I really miss those times."},
		{speaker:"Phil",text:"I also wish we could just turn back to those times and relive them."},
		{speaker:"Edna",text:"Too bad that time keeps moving forward."},
		{speaker:"Agape",portrait:"AgapeO",text:"How sad these mortals are looking."},
		{speaker:"Sophia",portrait:"SophiaNeutral",text:"They feel like prisoners of time."},
		{speaker:"Agape",portrait:"AgapeD",text:"Maybe we can intervene in bringing the love they need, up until the threads of fate will be cut for them."},
		{speaker:"Sophia",portrait:"SophiaNeutral",text:"Or they will just bring themselves closer to death with their grief."},
	];
	public static var OLDPEOPLE_OUTRO_GOOD:CutsceneData = [
		{speaker:"Phil",text:"Yes it does, but that doesn't mean we can't fully enjoy our time until it lasts. We may not be young any more, but at least our love towards each other is still as strong as it was then."},
		{speaker:"Edna",text:"Indeed, I feel the same way."},
		{speaker:"Phil",text:"How about we enjoy this beautiful day by taking a walk to the park."},
		{speaker:"Edna",text:"That sounds like an amazing idea."},
	];
	public static var OLDPEOPLE_OUTRO_BAD:CutsceneData = [
		{speaker:"Phil",text:"Yes, we are too old to be having moments like that."},
		{speaker:"Edna",text:"Why things can't feel the same anymore?"},
		{speaker:"Edna",portrait:"Nothing",text:"(faints)"},
		{speaker:"Phil",text:"Edna! Are you alright? I'm going to call an ambulance. Please don't die on me now!"},
	];
	public static var REVOLUTION_INTRO:CutsceneData = [
		{speaker:"Kayley",text:"DO BAD THINGS TO THE ESTABLISHMENT!",music:"Dramatic5"},
		{speaker:"Mikhail",text:"Hey, you! You can't protest!"},
		{speaker:"Kayley",text:"Says who?"},
		{speaker:"Mikhail",text:"Says the generic and fictional political overlord!"},
		{speaker:"Mikhail",text:"The supreme ruler of this country that is fictional and has no relation to a very real and very bad world event that started happening after this game started development!"},
		{speaker:"Mikhail",text:"Because if it was that country, this game would probably seem very insensitive!"},
		{speaker:"Kayley",text:"Understandable. However I still hate you personally for being a representative of that fictional but still bad government."},
		{speaker:"Mikhail",text:"I literally have a gun and I'm on orders to shoot protesters"},
		{speaker:"Agape",text:"..."},
		{speaker:"Agape",text:"Uh, let's intervene."},
		{speaker:"Sophia",portrait:"SophiaUh",text:"Indeed."},
	];
	public static var REVOLUTION_OUTRO_GOOD:CutsceneData = [
		{speaker:"Kayley",text:"Wow, I don't hate you anymore."},
		{speaker:"Mikhail",text:"And I'm not going to kill you."},
		{speaker:"Kayley",text:"It's strange, talking to you like this has made me realize that you're not so bad as a person just for being affiliated with a bad organization."},
		{speaker:"Mikhail",text:"It's like other people are actually people and don't become literal demons just because they disagree with you on something."},
		{speaker:"Kayley",text:"Maybe the human tendency to hate anything different from itself and accordingly form an us-vs-them worldview causes more harm than the actual difference in opinion."},
		{speaker:"Mikhail",text:"Da."},
	];
	public static var REVOLUTION_OUTRO_BAD:CutsceneData = [
		{speaker:"Mikhail",text:"I'm literally going to shoot you"},
	];
}

typedef CutsceneData = Array<DialogLineData>