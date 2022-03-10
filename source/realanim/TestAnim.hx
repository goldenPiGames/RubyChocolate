package realanim;

class TestAnim extends RealAnim {

	function createAnims() {
		loadGraphic("assets/images/realanim/realanimtest.png", true, 400, 300);
		animation.add("idle", [0]);
		animation.add("match", [2, 0], .5, false);
		animation.add("combo", [1, 0], .5, false);
		animation.play("idle");
	}
}