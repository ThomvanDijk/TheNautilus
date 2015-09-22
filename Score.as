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
			main.hiScore.loadScore();
		}
	}
	
}
