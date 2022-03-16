package realanim;

class GamerVsWeebAnim extends RealAnim {
	function createAnims() {
		loadGraphic("assets/images/realanim/GamerVsWeeb.png", true, 400, 300);
		animation.add("idle", [1, 2], 2, true);
		animation.add("match", [0, 3], 2, true);
		animation.add("combo", [0, 3], 2, true);
		animation.play("idle");
	}
}