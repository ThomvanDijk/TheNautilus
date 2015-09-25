package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Bullet extends MovieClip {
		
		var angle:Number;
		var main:Main;
		var speed:Number;

		public function Bullet(m:Main) {
			main = m;
			speed = 500;
			angle = 0;
		}
		
		//update player bullet
		public function playerBullet():void {
			this.y -= speed * main.deltaTime;
		}
		
		//update enemy bullet
		public function enemyBullet():void {
			this.y += speed * main.deltaTime;
		}
		
		public function removeBullet():Boolean {
			return (this.y > 900);
			return (this.y < 100);
		}
		
	}
	
}