package realanim;

class OldPeopleAnim extends RealAnim {
	function createAnims() {
		loadGraphic("assets/images/realanim/OldPeople.png", true, 400, 300);
		animation.add("idle", [0], 2, true);
		animation.add("match", [2, 2, 0], 1, false);
		animation.add("combo", [2, 2, 0], 1, false);
		animation.play("idle");
	}
}