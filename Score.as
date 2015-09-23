package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class Score extends SimpleButton {
		
		var main:Main;
		
		public function Score(m:Main) {
			main = m;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function onClick(event:MouseEvent):void {
			//Clean the stage.
			main.start.x = -2000;
			main.score.x = -2000;
			main.credits.x = -2000;
			
			//Add the high score.
			main.hiScore.loadScore();
			main.back.x = 350;
		}
	}
	
}
