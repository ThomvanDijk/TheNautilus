package  {
	
	import flash.display.MovieClip;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.text.TextField;
	import flash.events.IOErrorEvent
	
	public class HiScore extends MovieClip {
		
		var main:Main;
		var highScore:Array;
		
		public static const URL:String = "http://localhost/portfolio/games/content/highscores.php";
		
		private var _loader:URLLoader;
		private var _request:URLRequest;
 
		public function HiScore(m:Main) {
			main = m;
			highScore = new Array();
			loadData();
		}
		
		private function loadData():void {
			output("loadData");
			var randomParam:String = "?p=" + Math.floor(Math.random() * (10000000));
			_loader = new URLLoader();
			_request = new URLRequest(URL + randomParam);
			_request.method = URLRequestMethod.POST;
			_loader.addEventListener(Event.COMPLETE, onLoadData);
			_loader.addEventListener(IOErrorEvent.IO_ERROR, onDataFiledToLoad);
			_loader.addEventListener(IOErrorEvent.NETWORK_ERROR, onDataFiledToLoad);
			_loader.addEventListener(IOErrorEvent.VERIFY_ERROR, onDataFiledToLoad);
			_loader.addEventListener(IOErrorEvent.DISK_ERROR, onDataFiledToLoad);
			_loader.load(_request);
		}
		
		public function onLoadData(e:Event):void {
			output("onLoadData result=" + e.target.data);
		}
		
		private function onDataFiledToLoad(e:IOErrorEvent):void {
			output("onDataFiledToLoad error=" + e.text);
		}
		
		public function output(str:String):void {
			trace(str);
		}
		
		public function saveScore(playerName:String) {
			highScore.push({player: playerName, score: main.playerScore});
			//highScore.push({score: 918, player: "Harry"});
			highScore.sortOn("score", Array.DESCENDING | Array.NUMERIC);
			for (var i:int = 0; i < highScore.length; i++) {
				//trace(highScore[i].player, highScore[i].score);
			}
		}

	}
	
}
