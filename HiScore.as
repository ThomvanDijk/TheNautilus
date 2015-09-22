﻿package  {
	
	import flash.display.MovieClip;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import flash.events.IOErrorEvent
	
	public class HiScore extends MovieClip {
		
		var main:Main;
		var highScore:Array;
		
		public static const URL:String = "http://localhost/portfolio/develop/flashcontent/thenautilus/highscores.php";
		
		private var getLoader:URLLoader;
		private var getRequest:URLRequest;
		private var setLoader:URLLoader;
		private var setRequest:URLRequest;
		private var urlvars:URLVariables;
 
		public function HiScore(m:Main) {
			main = m;
			highScore = new Array();
			loadScore();
		}
		
		public function loadScore():void {
			var randomParam:String = "?p=" + Math.floor(Math.random() * (10000000));
			getLoader = new URLLoader();
			getRequest = new URLRequest(URL + randomParam);
			getRequest.method = URLRequestMethod.POST;
			getLoader.addEventListener(Event.COMPLETE, onLoadData);
			getLoader.addEventListener(IOErrorEvent.IO_ERROR, onDataFiledToLoad);
			getLoader.addEventListener(IOErrorEvent.NETWORK_ERROR, onDataFiledToLoad);
			getLoader.addEventListener(IOErrorEvent.VERIFY_ERROR, onDataFiledToLoad);
			getLoader.addEventListener(IOErrorEvent.DISK_ERROR, onDataFiledToLoad);
			getLoader.load(getRequest);
		}
		
		public function saveScore(playerName:String):void {
			setLoader = new URLLoader;
			setRequest = new URLRequest(URL);
			urlvars = new URLVariables;
			setLoader.dataFormat = URLLoaderDataFormat.VARIABLES;
			setRequest.method = URLRequestMethod.POST;
			urlvars.name = playerName;
			urlvars.score = main.playerScore;
			setRequest.data = urlvars;
			setLoader.load(setRequest);
		}
		
		public function onLoadData(e:Event):void {
			var databaseString:String = (e.target.data);
			//trace(databaseString); //onLoadData result.
			highScore = databaseString.split(",");
			
			trace(highScore[0]);
			
			//highScore.push({player: playerName, score: main.playerScore});
			//highScore.push({score: 918, player: "Harry"});
			//highScore.sortOn("score", Array.DESCENDING | Array.NUMERIC);
			//for (var i:int = 0; i < highScore.length; i++) {
				//trace(highScore[i].player, highScore[i].score);
			//}

		}
		
		private function onDataFiledToLoad(e:IOErrorEvent):void {
			trace("onDataFiledToLoad error=" + e.text);
		}

	}
	
}
