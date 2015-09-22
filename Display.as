package  {
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	
	public class Display {
		
		var text1:TextField = new TextField();
		var text4:TextField = new TextField();
		var text1Format:TextFormat = new TextFormat();
		
		var text2:TextField = new TextField();
		var text3:TextField = new TextField();
		var text5:TextField = new TextField();
		var text6:TextField = new TextField();
		var text2Format:TextFormat = new TextFormat();
		
		var inputField:TextField = new TextField();
		
		var mainFont:Visitor = new Visitor();
		var main:Main;

		public function Display(m:Main) {
			main = m;
			
			text1Format.size = 80;
			text1Format.font = mainFont.fontName;
			
			text2Format.size = 30;
			text2Format.font = mainFont.fontName;
			
			//game over text and upgrades text
			text1.x = -2000;
			text1.border = false;
			text1.textColor = 0xFFFFFF;
			text1.autoSize = TextFieldAutoSize.CENTER;
			text1.defaultTextFormat = text1Format;
			main.addChild(text1);
			text1.text = "Game Over"
			
			text4.x = -2000;
			text4.border = false;
			text4.textColor = 0xFFFFFF;
			text4.autoSize = TextFieldAutoSize.CENTER;
			text4.defaultTextFormat = text1Format;
			
			//already add the upgrades text
			main.addChild(text4);
			text4.alpha = 0;

			//heads up display text
			text2.x = -2000;
			text2.border = false;
			text2.textColor = 0xFFFFFF;
			text2.autoSize = TextFieldAutoSize.LEFT;
			text2.defaultTextFormat = text2Format;
			main.addChild(text2);
			
			text3.x = -2000;
			text3.border = false;
			text3.textColor = 0xFFFFFF;
			text3.autoSize = TextFieldAutoSize.LEFT;
			text3.defaultTextFormat = text2Format;
			main.addChild(text3);
			
			text5.x = -2000;
			text5.border = false;
			text5.textColor = 0xFFFFFF;
			text5.autoSize = TextFieldAutoSize.LEFT;
			text5.defaultTextFormat = text2Format;
			main.addChild(text5);
			text5.text = "Enter your name:"

			//Input filed.
			inputField = new TextField();
			inputField.type = TextFieldType.INPUT;
			inputField.defaultTextFormat = text2Format;
			inputField.background = true;
			inputField.width = 200;
			inputField.height = 30;
			main.addChild(inputField);
			inputField.x = -2000;
			
			//HighScore table.
			text6.x = -2000;
			text6.y = 100;
			text6.border = false;
			text6.textColor = 0xFFFFFF;
			text6.autoSize = TextFieldAutoSize.LEFT;
			text6.defaultTextFormat = text2Format;
			main.addChild(text6);
		}
		
		public function update():void {
			if (text4.alpha > 0) {
				text4.alpha -= 0.5 * main.deltaTime;
			}
		}
		
		public function gameOverText():void {
			text1.x = 150;
			text1.y = 250;
			
			text5.x = 220;
			text5.y = 360;
			
			inputField.x = 250;
			inputField.y = 400;
			
			main.submit.x = 350;
			main.submit.y = 500;
		}
		
		public function damageText():void {
			text2.x = 10;
			text2.y = 765;
			text2.text = "Hi-Score " + String(main.hiScore.loadScore());
		}
		
		public function scoreText():void {
			text3.x = 10;
			text3.y = 735;
			text3.text = "  Score " + String(main.playerScore);
		}
		
		public function upgradeText(upgrade):void {
			text4.x = 300;
			text4.y = 300;
			text4.alpha = 1;
			text4.text = String(upgrade);
		}
		
		public function highScoreTable():void {
			text6.x = 250;
			text6.text = "High Scores: " + "\n" + main.hiScore.highScore[1].player;

		}

	}
	
}
