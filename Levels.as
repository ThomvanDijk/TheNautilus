package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Levels extends MovieClip {
		
		var main:Main;
		
		var tier01:Boolean;
		var tier02:Boolean;
		var tier03:Boolean;
		var tier04:Boolean;
		var tier05:Boolean;
		var tier06:Boolean;
		var tier07:Boolean;
		var tier08:Boolean;
		var tier09:Boolean;
		var tier10:Boolean;
		var tier11:Boolean;

		public function Levels(m:Main) {
			main = m;
		}
		
		public function update():void {
			if (main.playerScore == 80 && !tier01) {
				main.player.speed *= 1.5;
				main.display.upgradeText("Speedx1.5!");
				tier01 = true;
			}
			if (main.playerScore == 170 && !tier02) {
				main.enemyType = 2;
				main.display.upgradeText("New Enemy!");
				tier02 = true;
			}
			if (main.playerScore == 270 && !tier03) {
				main.player.maxtemp = 8;
				main.display.upgradeText("Cooldown Lowered!");
				tier03 = true;
			}
			if (main.playerScore == 380 && !tier04) {
				main.enemyType = 3;
				main.display.upgradeText("New Enemy!");
				tier04 = true;
			}
			if (main.playerScore == 500 && !tier05) {
				main.enemyCooldown = 8;
				main.display.upgradeText("Enemies Schoot Faster!");
				tier05 = true;
			}
			if (main.playerScore == 630 && !tier06) {
				main.player.speed *= 1.5;
				main.display.upgradeText("Speedx1.5!");
				tier06 = true;
			}
			if (main.playerScore == 770 && !tier07) {
				main.enemyType = 4;
				main.display.upgradeText("New Enemy!");
				tier07 = true;
			}
			if (main.playerScore == 920 && !tier08) {
				main.player.maxtemp = 6;
				main.display.upgradeText("Cooldown Lowered");
				tier08 = true;
			}
			if (main.playerScore == 1080 && !tier09) {
				main.enemyCooldown = 6;
				main.display.upgradeText("Enemies Schoot Faster!");
				tier09 = true;
			}
			if (main.playerScore == 1250 && !tier10) {
				main.enemyType = 5;
				main.display.upgradeText("New Enemy!");
				tier10 = true;
			}
			if (main.playerScore == 1430 && !tier11) {
				main.spawnRate = 0.92;
				main.display.upgradeText("Spawn Rate Increased!");
				tier11 = true;
			}
		}

	}
	
}
