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
			main.start.x = 4000;
			main.score.x = 4000;
			main.credits.x = 4000;
			main.player.alpha = 1;
			main.display.text2.alpha = 1;
			main.display.text3.alpha = 1;
		}
	}
	
}
