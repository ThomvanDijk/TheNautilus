package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Levels extends MovieClip {
		
		var main:Main;
		
		var tier1:Boolean;
		var tier2:Boolean;
		var tier3:Boolean;

		public function Levels(m:Main) {
			main = m;
		}
		
		public function update():void {
			if (main.playerScore == 60 && !tier1) {
				main.player.speed *= 1.5;
				main.display.upgradeText("speedx1.5!");
				tier1 = true;
			}
			if (main.playerScore == 120 && !tier2) {
				main.enemyType = 2;
				main.player.speed *= 1.5;
				main.display.upgradeText("speedx1.5!");
				tier2 = true;
			}
			if (main.playerScore == 180 && !tier3) {
				main.enemyType = 3;
				main.display.upgradeText("speedx1.5!");
				tier3 = true;
			}
		}

	}
	
}
