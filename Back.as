package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class Back extends SimpleButton {
		
		var main:Main;
		
		public function Back(m:Main) {
			main = m;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function onClick(event:MouseEvent):void {
			//Clean the stage
			main.display.text6.x = -2000;
			main.display.text7.x = -2000;
			main.display.text8.x = -2000;
			main.display.text9.x = -2000;
			this.x = -2000;
			
			//Add the menu.
			main.start.x = 350;
			main.score.x = 350;
			main.credits.x = 350;
		}
	}
	
}
