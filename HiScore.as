package  {
	
	import flash.display.MovieClip;
	
	public class HiScore extends MovieClip {
		
		var main:Main;
		var highScore:Array;

		public function HiScore(m:Main) {
			main = m;
			highScore = new Array();
		}
		
		public function saveScore(playerName:String) {
			highScore.push({player: playerName, score: main.playerScore});
			//highScore.push({score: 918, player: "Harry"});
			highScore.sortOn("score", Array.DESCENDING | Array.NUMERIC);
			for (var i:int = 0; i < highScore.length; i++) {
				trace(highScore[i].player, highScore[i].score);
			}
		}

	}
	
}
