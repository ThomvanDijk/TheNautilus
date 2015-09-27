package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class Score extends SimpleButton {
		
		var main:Main;
		var clicked:Boolean;
		
		public function Score(m:Main) {
			main = m;
			clicked = false;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function update():void {
			if(main.hiScore.scoreLoaded && clicked) {
				main.display.highScoreTable();
				main.hiScore.scoreLoaded = false;
				clicked = false;
			}
		}
		
		public function onClick(event:MouseEvent):void {
			main.sound.buttonHit();
			
			clicked = true;
			main.hiScore.loadScore();
			
			//Clean the stage.
			main.start.x = -2000;
			main.score.x = -2000;
			main.credits.x = -2000;
			
			//Add the high score.
			main.back.x = 350;
		}
	}
	
}
