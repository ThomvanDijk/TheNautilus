﻿package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	public class Submit extends SimpleButton {
		
		var main:Main;
		var trim:RegExp;

		public function Submit(m:Main) {
			main = m;
			trim = /[\s\r\n]+/gim;
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function onClick(event:MouseEvent):void {
			if(main.display.inputField.text.length <= 12 && 
			main.display.inputField.text.length >= 1 &&
			(main.display.inputField.text.indexOf(",") == -1)) {
				main.sound.buttonHit();
				main.sound.stopMusic();
				main.sound.startMusic();
					
				//On stage text and input fields are mover away.
				main.display.text1.x = -2000;
				main.display.text2.x = -2000;
				main.display.text3.x = -2000;
				main.display.text4.x = -2000;
				main.display.text5.x = -2000;
				main.display.healthBar.x = -2000;
				main.display.healthBar.width = 200;
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
				
				//Set the color white again.
				main.display.inputField.textColor = 0x000000;
				
				//Save the players name.
				if(main.playerScore >= main.hiScore.highScore[10].score) {
					var temp:String;
					temp = main.display.inputField.text;
					temp = temp.replace(trim,'');
					main.hiScore.saveScore(temp);
				}
				
				//This button is moved away.
				this.x = -2000;
				
				//Main menu is positioned back.
				main.start.x = 350;
				main.score.x = 350;
				main.credits.x = 350;
			}
			else {
				main.display.inputField.textColor = 0xFF0000;
			}
		}

	}
	
}
