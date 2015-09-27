package  {
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	import flash.text.Font;
	
	public class Display {
		//Embed font below.
		[Embed(source="Visitor.ttf", 
			fontName = "visitorFont", 
			mimeType = "application/x-font", 
			fontWeight = "normal", 
			fontStyle = "normal", 
			//unicodeRange = "englishRange", 
			advancedAntiAliasing = "true", 
			embedAsCFF = "false")]
		private var visitorFont:Class;
		
		var text1:TextField = new TextField();
		var text4:TextField = new TextField();
		var text1Format:TextFormat = new TextFormat("visitorFont");
		
		var text2:TextField = new TextField();
		var text3:TextField = new TextField();
		var text5:TextField = new TextField();
		var text2Format:TextFormat = new TextFormat("visitorFont");
		
		var text9:TextField = new TextField();
		var text5Format:TextFormat = new TextFormat("visitorFont");
		
		var text6:TextField = new TextField();
		var text7:TextField = new TextField();
		var text3Format:TextFormat = new TextFormat("visitorFont");
		
		var text8:TextField = new TextField();
		var text4Format:TextFormat = new TextFormat("visitorFont");
		
		var inputField:TextField = new TextField();

		var healthBar:HealthBar;
		var main:Main;

		public function Display(m:Main) {
			main = m;

			healthBar = new HealthBar();
			healthBar.x = -2000;
			healthBar.y = 760;
			healthBar.width = 200;
			healthBar.height = 20;
			main.addChild(healthBar);
			
			text1Format.size = 80;
			text1Format.align = TextFormatAlign.CENTER;
			//text1Format.font = mainFont.fontName;
			
			text2Format.size = 30;
			//text2Format.font = mainFont.fontName;
			
			text3Format.size = 50;
			//text3Format.font = mainFont.fontName;
			
			text4Format.size = 50;
			text4Format.align = TextFormatAlign.RIGHT;
			//text4Format.font = mainFont.fontName;
			
			text5Format.size = 30;
			text5Format.align = TextFormatAlign.CENTER;
			//text5Format.font = mainFont.fontName;
			
			//game over text and upgrades text
			text1.x = -2000;
			text1.embedFonts = true;
			text1.border = false;
			text1.textColor = 0xFFFFFF;
			text1.width = 600;
			text1.defaultTextFormat = text1Format;
			main.addChild(text1);
			text1.text = "Game Over"
			
			text4.x = -2000;
			text4.y = 300;
			text4.embedFonts = true;
			text4.border = false;
			text4.textColor = 0xFFFFFF;
			text4.width = 650;
			text4.height = 300;
			text4.wordWrap = true;
			text4.defaultTextFormat = text1Format;
			
			//already add the upgrades text
			main.addChild(text4);
			text4.alpha = 0;

			//heads up display text
			text2.x = -2000;
			text2.embedFonts = true;
			text2.border = false;
			text2.textColor = 0xFFFFFF;
			text2.autoSize = TextFieldAutoSize.LEFT;
			text2.defaultTextFormat = text2Format;
			main.addChild(text2);
			
			text3.x = -2000;
			text3.embedFonts = true;
			text3.border = false;
			text3.textColor = 0xFFFFFF;
			text3.autoSize = TextFieldAutoSize.LEFT;
			text3.defaultTextFormat = text2Format;
			main.addChild(text3);
			
			text5.x = -2000;
			text5.embedFonts = true;
			text5.border = false;
			text5.textColor = 0xFFFFFF;
			text5.width = 600;
			text5.defaultTextFormat = text5Format;
			main.addChild(text5);
			text5.text = "Enter your name:"

			//Input filed.
			inputField = new TextField();
			inputField.embedFonts = true;
			inputField.type = TextFieldType.INPUT;
			inputField.defaultTextFormat = text2Format;
			inputField.background = true;
			inputField.width = 200;
			inputField.height = 30;
			main.addChild(inputField);
			inputField.x = -2000;
			
			//HighScore ranks.
			text6.x = -2000;
			text6.y = 50;
			text6.embedFonts = true;
			text6.border = false;
			text6.textColor = 0xFFFFFF;
			text6.autoSize = TextFieldAutoSize.LEFT;
			text6.defaultTextFormat = text3Format;
			main.addChild(text6);
			
			//Highscore table names.
			text7.x = -2000;
			text7.y = 50;
			text7.embedFonts = true;
			text7.border = false;
			text7.textColor = 0xFFFFFF;
			text7.autoSize = TextFieldAutoSize.LEFT;
			text7.defaultTextFormat = text3Format;
			main.addChild(text7);
			
			//Highscore table scores.
			text8.x = -2000;
			text8.y = 50;
			text8.embedFonts = true;
			text8.border = false;
			text8.textColor = 0xFFFFFF;
			text8.width = 350;
			text8.height = 600;
			text8.defaultTextFormat = text4Format;
			main.addChild(text8);
			
			//Highscore table scores.
			text9.x = -2000;
			text9.y = 265;
			text9.embedFonts = true;
			text9.border = false;
			text9.textColor = 0xFFFFFF;
			text9.autoSize = TextFieldAutoSize.LEFT;
			text9.defaultTextFormat = text5Format;
			main.addChild(text9);
		}
		
		public function update():void {
			if (text4.alpha > 0) {
				text4.alpha -= 0.5 * main.deltaTime;
			}
		}
		
		public function gameOverText():void {
			text1.x = 50;
			text1.y = 250;
			
			text5.x = 50;
			text5.y = 360;
			
			inputField.x = 250;
			inputField.y = 400;
			
			main.submit.x = 350;
			main.submit.y = 500;
		}
		
		public function damageText():void {
			healthBar.x -= 10;
			healthBar.width -= 20;
		}
		
		public function hiScoreText():void {
			text2.x = 10;
			text2.y = 765;
			text2.text = "Hi-Score " + main.hiScore.highScore[1].score;
		}
		
		public function scoreText():void {
			text3.x = 10;
			text3.y = 735;
			text3.text = "  Score " + main.playerScore;
		}
		
		public function upgradeText(upgrade):void {
			text4.x = 25;
			text4.alpha = 1;
			text4.text = String(upgrade);
		}
		
		public function highScoreTable():void {
			//Highscore names
			text6.x = 20;
			text6.text = "      High Scores:" + "\n\n" 
			+ "#1" + "\n"
			+ "#2" + "\n"
			+ "#3" + "\n"
			+ "#4" + "\n"
			+ "#5" + "\n"
			+ "#6" + "\n"
			+ "#7" + "\n"
			+ "#8" + "\n"
			+ "#9" + "\n"
			+ "#10";
			
			//Highscore scores
			text7.x = 110;
			text7.text = "\n\n" +
			main.hiScore.highScore[1].player + "\n"
			+ main.hiScore.highScore[2].player + "\n"
			+ main.hiScore.highScore[3].player + "\n"
			+ main.hiScore.highScore[4].player + "\n"
			+ main.hiScore.highScore[5].player + "\n"
			+ main.hiScore.highScore[6].player + "\n"
			+ main.hiScore.highScore[7].player + "\n"
			+ main.hiScore.highScore[8].player + "\n"
			+ main.hiScore.highScore[9].player + "\n"
			+ main.hiScore.highScore[10].player;
			
			text8.x = 330;
			text8.text = "\n\n" +
			main.hiScore.highScore[1].score + "\n"
			+ main.hiScore.highScore[2].score + "\n"
			+ main.hiScore.highScore[3].score + "\n"
			+ main.hiScore.highScore[4].score + "\n"
			+ main.hiScore.highScore[5].score + "\n"
			+ main.hiScore.highScore[6].score + "\n"
			+ main.hiScore.highScore[7].score + "\n"
			+ main.hiScore.highScore[8].score + "\n"
			+ main.hiScore.highScore[9].score + "\n"
			+ main.hiScore.highScore[10].score;
		}
		
		public function creditsText():void {
			text6.x = 254;
			text6.text = "Credits";
			text9.x = 197;
			text9.text = "Development:" + "\n"
			+ "Thom van Dijk" + "\n\n"
			+ "Artwork:" + "\n"
			+ "Michiel Bastiaannet" + "\n\n"
			+ "Main Theme:" + "\n"
			+ "Visager - Airship";
		}

	}
	
}
