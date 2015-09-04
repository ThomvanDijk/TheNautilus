package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class Start extends SimpleButton {
		
		var main:Main;
		
		public function Start(m:Main) {
			main = m;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function onClick(event:MouseEvent):void {
			main.started = true;
			
			main.start.x = -2000;
			main.score.x = -2000;
			main.credits.x = -2000;
			
			main.player.x = 350;
			main.display.damageText();
			main.display.scoreText();
		}
	}
	
}
