package  {
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	
	public class Display {
		
		var text1:TextField = new TextField();
		var text4:TextField = new TextField();
		var text1Format:TextFormat = new TextFormat();
		
		var text2:TextField = new TextField();
		var text3:TextField = new TextField();
		var text2Format:TextFormat = new TextFormat();
		
		var mainFont:Visitor = new Visitor();
		var main:Main;

		public function Display(m:Main) {
			main = m;
			
			//game over text and upgrades text
			text1.x = 300;
			text1.y = 300;
			text1.border = false;
			text1.textColor = 0xFFFFFF;
			text1.autoSize = TextFieldAutoSize.CENTER;
			
			text4.x = 300;
			text4.y = 300;
			text4.border = false;
			text4.textColor = 0xFFFFFF;
			text4.autoSize = TextFieldAutoSize.CENTER;
			
			//already add the upgrades text
			main.addChild(text4);
			text4.alpha = 0;
			
			text1Format.size = 80;
			text1Format.font = mainFont.fontName;
			
			//heads up display text
			text2.x = 10;
			text2.y = 765;
			text2.border = false;
			text2.textColor = 0xFFFFFF;
			text2.alpha = 0;
			text2.autoSize = TextFieldAutoSize.LEFT;
			
			text3.x = 10;
			text3.y = 735;
			text3.border = false;
			text3.textColor = 0xFFFFFF;
			text3.alpha = 0;
			text3.autoSize = TextFieldAutoSize.LEFT;
			
			text2Format.size = 30;
			text2Format.font = mainFont.fontName;
			
			text1.defaultTextFormat = text1Format;
			text4.defaultTextFormat = text1Format;
			text2.defaultTextFormat = text2Format;
			text3.defaultTextFormat = text2Format;
			
			damageText();
			scoreText();
		}
		
		public function update():void {
			if (text4.alpha > 0) {
				text4.alpha -= 0.5 * main.deltaTime;
			}
		}
		
		public function gameOverText():void {
			main.addChild(text1);
			text1.text = "Game Over"
		}
		
		public function damageText():void {
			main.addChild(text2);
			text2.text = "Hi-Score " + String(main.player.damageTaken);
		}
		
		public function scoreText():void {
			main.addChild(text3);
			text3.text = "  Score " + String(main.playerScore);
		}
		
		public function upgradeText(upgrade):void {
			text4.alpha = 1;
			text4.text = String(upgrade);
		}

	}
	
}
