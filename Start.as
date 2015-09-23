package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
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
				main.display.damageText();
				main.display.scoreText();
				main.hiScore.scoreLoaded = false;
				clicked = false;
			}
		}
		
		public function onClick(event:MouseEvent):void {
			clicked = true;
			main.started = true;
			main.hiScore.loadScore();
			
			main.start.x = -2000;
			main.score.x = -2000;
			main.credits.x = -2000;
			
			main.player.x = 350;
			main.playerScore = 0;
		}
	}
	
}
