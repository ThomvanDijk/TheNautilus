package  {
	
	import flash.display.MovieClip;
	
	public class Enemy extends MovieClip {
		
		var cooldown:Number;
		var weaponTemp:Number;
		var state:int;
		var playFrame:int;
		var firstExplodingFrame:int;
		var lastExplodingFrame:int;
		var scale:Number;
		var speed:Number;
		var angle:Number;
		var main:Main;
			
		public function Enemy(m:Main) {
			main = m;
			
			randomWeaponTemp();
			cooldown = weaponTemp;
			state = 0;
			playFrame = 1;
			firstExplodingFrame = 6;
			lastExplodingFrame = 14;
			speed = 50;
			this.x = (Math.random()*650) + 25;
			firstExplodingFrame--;
		}
		
		public function update():void {
			if (state == 0) {
				//playFrame = 1;
			}
			if (state == 1) {
				playFrame = firstExplodingFrame++;
				if (playFrame >= lastExplodingFrame) {
					playFrame = lastExplodingFrame;
					state = 2;
				}
			}
			if (state == 2) {
				playFrame = lastExplodingFrame + 1;
				this.x = 2000;
			}
			this.gotoAndStop(playFrame);
			movement();
		}
		
		public function movement():void {
			this.y += speed * main.deltaTime;
		}
		
		public function shootBullet():Bullet {
			if(cooldown == 0) {
				var bullet:Bullet = new Bullet(main);
				cooldown = weaponTemp;
				return bullet;
			}
			return null;
		}
		
		public function cooldownTimer():void {
			if(cooldown > 0) {
				cooldown--;
			}
		}

		public function randomWeaponTemp():void {
			weaponTemp = Math.ceil(Math.random()*150)+10;
		}
		
	}
	
}

