package  {
	
	import flash.display.MovieClip;
	
	
	public class Particle extends MovieClip {
		
		var twinkel:Boolean;
		var random:Number;
		var countDown:Number;
		var main:Main;
		
		public function Particle(m:Main) {
			main = m;
			//position = new Vector2(Math.random()*700, 0);
			//this.alpha = Math.random();
			this.x = Math.random()*700;
			random = Math.random();
			this.alpha = Math.random();
			countDown = 0;
			twinkel = true;
		}
		
		public function update():void {
			this.y += 30 * main.deltaTime;
			
			if (random < 0.5) {
				if (countDown == 0 || twinkel) {
					countDown++;
					this.alpha += 0.01;
					twinkel = true;
				}
				if (countDown == 100 || !twinkel) {
					countDown--;
					this.alpha -= 0.01;
					twinkel = false;
				}
			}
			
			if (random < 0.05) {
				this.alpha = Math.random();
			}
		}
	}
	
}
