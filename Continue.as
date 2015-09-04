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
			
			//The levels are reset.
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
			
			//Player is reset.
			main.player.damageTaken = 0;
			main.player.speed = 200;
			main.player.cooldown = 10;
			main.player.state = 0;
			main.player.playFrame = 1;
			
			//Save the players name.
			var str:String = main.display.inputField.text;
			trace(str);
			
			//This button is moved away.
			this.x = -2000;
			
			//Main menu is positioned back.
			main.start.x = 350;
			main.score.x = 350;
			main.credits.x = 350;
		}

	}
	
}
