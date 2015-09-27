package  {
	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class Start extends SimpleButton {
		
		var main:Main;
		var clicked:Boolean;
		
		public function Start(m:Main) {
			main = m;
			clicked = false;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function update():void {
			if(main.hiScore.scoreLoaded && clicked) {
				main.display.hiScoreText();
				main.display.scoreText();
				main.hiScore.scoreLoaded = false;
				clicked = false;
			}
		}
		
		public function onClick(event:MouseEvent):void {
			main.sound.buttonHit();
			
			clicked = true;
			main.started = true;
			main.hiScore.loadScore();
			
			main.start.x = -2000;
			main.score.x = -2000;
			main.credits.x = -2000;
			
			main.player.x = 350;
			main.player.maxtemp = 10;
			main.player.speed = 200;
			main.spawnRate = 0.96;
			main.playerScore = 0;
			main.enemyCooldown = 10;
			main.enemyType = 1;
			main.display.healthBar.x = 420;
			
			main.levels.tier01 = false;
			main.levels.tier02 = false;
			main.levels.tier03 = false;
			main.levels.tier04 = false;
			main.levels.tier05 = false;
			main.levels.tier06 = false;
			main.levels.tier07 = false;
			main.levels.tier08 = false;
			main.levels.tier09 = false;
			main.levels.tier10 = false;
			main.levels.tier11 = false;
		}
	}
	
}
