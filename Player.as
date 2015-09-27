package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Player extends MovieClip {
		
		var speed:Number;
		var cooldown:Number;
		var maxtemp:Number;
		var damageTaken:Number;
		var state:int;
		var playFrame:int;
		var lastExplodingFrame:int;
		var main:Main;
		
		public function Player(m:Main) {
			main = m;
			damageTaken = 0;
			speed = 220;
			maxtemp = 10;
			cooldown = maxtemp;
			state = 0;
			playFrame = 1;
			lastExplodingFrame = 15;
			this.x = 350;
			this.y = 700;
		}
		
		public function update():void {
			if (state == 0) {
				playFrame = 1;
			}
			if (state == 1) {
				playFrame++;
				if (playFrame >= lastExplodingFrame) {
					playFrame = lastExplodingFrame + 1;
					state = 2;
				}
			}
			if (state == 2) {
				this.cooldown = -1;
				main.started = false;
				main.sound.playerExplode();
				main.display.text4.x = -2000;
			}
			this.gotoAndStop(playFrame);
		}
		
		public function bulletHit():void {
			damageTaken ++;
			//trace(damageTaken);
			if (damageTaken >= 10) {
				this.state = 1;
				main.display.gameOverText();
			}
		}
		
		public function left():void {
			this.x -= speed * main.deltaTime;
		}
		
		public function right():void {
			this.x += speed * main.deltaTime;
		}
		
		public function up():void {
			this.y -= speed * main.deltaTime;
		}
		
		public function down():void {
			this.y += speed * main.deltaTime;
		}
		
		public function shootBullet():Bullet {
			if(cooldown == 0) {
				var bullet:Bullet = new Bullet(main);
				cooldown = maxtemp;
				return bullet;
			}
			return null;
		}
		
		public function cooldownTimer():void {
			if(cooldown > 0) {
				cooldown--;
			}
		}
	}
}

