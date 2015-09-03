package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class Continue extends SimpleButton {
		
		var main:Main;

		public function Continue(m:Main) {
			main = m;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function onClick(event:MouseEvent):void {
			//On stage text and input fields are mover away.
			main.display.text1.x = -2000;
			main.display.text2.x = -2000;
			main.display.text3.x = -2000;
			main.display.text4.x = -2000;
			main.display.text5.x = -2000;
			main.display.inputField.x = -2000;
			this.x = -2000;
			
			//Main menu is positioned back.
			main.start.x = 350;
			main.score.x = 350;
			main.credits.x = 350;
		}

	}
	
}
