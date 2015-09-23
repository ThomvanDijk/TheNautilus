package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class Credits extends SimpleButton {
		
		var main:Main;
		
		public function Credits(m:Main) {
			main = m;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function onClick(event:MouseEvent):void {
			//Clean the stage.
			main.start.x = -2000;
			main.score.x = -2000;
			main.credits.x = -2000;
			
			//Add Credits.
			main.display.creditsText();
			main.back.x = 350;
		}
	}
	
}
