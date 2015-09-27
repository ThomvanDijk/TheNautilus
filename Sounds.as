package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	public class Sounds extends MovieClip {
		
		var main:Main;
		var clicked:Boolean;
		
		var volume1:SoundTransform;
		var volume2:SoundTransform;
		var volume3:SoundTransform;
		var volume4:SoundTransform;
		var volume5:SoundTransform;
		
		var mainTheme:Sound;
		var enemyExplodeSound:Sound;
		var playerHitSound:Sound;
		var playerShootSound:Sound;
		var playerExplodeSound:Sound;
		var buttonHitSound:Sound;
		
		var musicChannel:SoundChannel;
		var effectsChannel1:SoundChannel;
		var effectsChannel2:SoundChannel;
		var effectsChannel3:SoundChannel;
		var effectsChannel4:SoundChannel;
		var effectsChannel5:SoundChannel;
		
		public function Sounds(m:Main) {
			main = m;
			clicked = false;
			
			volume1 = new SoundTransform(0.01);
			volume2 = new SoundTransform(0.09);
			volume3 = new SoundTransform(0.3);
			volume4 = new SoundTransform(1.2);
			volume5 = new SoundTransform(1.4);
			
			mainTheme = new MainTheme();
			enemyExplodeSound = new EnemyExplode();
			playerShootSound = new PlayerShoot();
			playerHitSound = new PlayerHit();
			playerExplodeSound = new PlayerExplode();
			buttonHitSound = new ButtonHit();
			
			musicChannel = mainTheme.play(0, 1, volume2);
			
			addEventListener(MouseEvent.CLICK, onClick);
			this.buttonMode = true;
			this.useHandCursor = true;
			this.gotoAndStop(1);
		}
		
		public function onClick(event:MouseEvent):void {
			clicked = !clicked;
			if(clicked) {
				this.gotoAndStop(2);
				stopMusic();
			}
			if(!clicked) {
				this.gotoAndStop(1);
				startMusic();
			}
		}
		
		public function enemyExplode():void {
			if(!clicked) {
				effectsChannel1 = enemyExplodeSound.play(0, 0, volume3);
			}
		}
		
		public function playerHit():void {
			if(!clicked) {
				effectsChannel2 = playerHitSound.play(0, 0, volume4);
			}
		}
		
		public function playerShoot():void {
			if(!clicked) {
				effectsChannel5 = playerShootSound.play(0, 0, volume1);
			}
		}
		
		public function playerExplode():void {
			if(!clicked) {
				effectsChannel3 = playerExplodeSound.play(1000, 0, volume3);
			}
		}
		
		public function buttonHit():void {
			if(!clicked) {
				effectsChannel4 = buttonHitSound.play(0, 0, volume5);
			}
		}
		
		public function startMusic():void {
			if(!clicked) {
				musicChannel = mainTheme.play(0, 1, volume2);
			}
		}
		
		public function stopMusic():void {
			musicChannel.stop();
		}
		
	}
	
}
