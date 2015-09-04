package  {
	
	import flash.display.MovieClip;
	
	public class HiScore extends MovieClip {
		
		var main:Main;
		var highScore:Array;

		public function HiScore(m:Main) {
			main = m;
			highScore = new Array[10];
		}

	}
	
}
