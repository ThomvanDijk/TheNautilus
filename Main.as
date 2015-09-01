package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.DisplayObject;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	public class Main extends MovieClip {
		
		var left:Boolean;
		var right:Boolean;
		var up:Boolean;
		var down:Boolean;
		var started:Boolean;
		var special:Boolean;
		
		var bulletListPlayer:Array;
		var bulletListEnemy:Array;
		var enemyList:Array;
		var particleList:Array;
		var explotionList:Array;
		
		var player:Player;
		var particle:Particle;
		var display:Display;
		var levels:Levels;
		
		var start:Start;
		var score:Score;
		var credits:Credits;
		var aback:Aback;
		
		var playerScore:int;
		var maxParticles:int;
		var beginTime:int;
		var maxEnemies:int;
		var enemyType:int;
		var spawnRate:Number;
		var deltaTime:Number;
		
		public function Main() {
			bulletListPlayer = new Array();
			bulletListEnemy = new Array();
			enemyList = new Array();
			particleList = new Array();
			explotionList = new Array();
			
			start = new Start(this);
			addChild(start);
			start.x = 350;
			start.y = 300;
			
			score = new Score(this);
			addChild(score);
			score.x = 350;
			score.y = 360;
			
			credits = new Credits(this);
			addChild(credits);
			credits.x = 350;
			credits.y = 420;
			
			aback = new Aback(this);
			addChild(aback);
			aback.x = 4000;
			aback.y = 300;
			
			playerScore = 0;
			deltaTime = 0;
			maxParticles = 100;
			spawnRate = 0.99;
			maxEnemies = 30;
			enemyType = 1;
			
			player = new Player(this);
			addChild(player);
			player.alpha = 0;
			player.gotoAndStop(1);
			
			display = new Display(this);
			levels = new Levels(this)
			beginTime = getTimer();

			stage.addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}
		
		private function update(event:Event):void {
			var currentTime:int = getTimer();
			deltaTime = (currentTime - beginTime) * 0.001;
			beginTime = currentTime;
			//trace(deltaTime);
			createBackground();
			playerBulletPosition();
			enemyBulletPosition();
			updateEnemies();
			
			if (!started) {
				
			}
			
			if (started) {
				if (left) {
					player.left();
				}
				if (right) {
					player.right();
				}
				if (up) {
					player.up();
				}
				if (down) {
					player.down();
				}
				if (special) {
					trace("Special!");
				}
				
				player.cooldownTimer();
				bulletCollisionPlayer();
				bulletCollisionEnemy();
				enemyCollisionPlayer();
				playerShoot();
				enemyShoot();
				addEnemies();
				stageBoundaries();
				player.update();
				levels.update();
				display.update();
				checkEnemyAlive();
			}
		}
		
		public function addEnemies():void {
			if (Math.random() > spawnRate) {
				var enemy:Enemy = new Enemy(this);
				enemy.playFrame = enemyType;
				addChild(enemy);
				enemyList.push(enemy);
			}
			if (enemyList.length > maxEnemies) {
				removeChild(enemyList.shift());
			}
			for (var i = 0; i < enemyList.length; i++) {
				enemyList[i].update();
				if (enemyList[i].y > 830) {
					removeInstance(enemyList[i]);
					enemyList.splice(i, 1);
				}
			}
		}
		
		public function bulletCollisionEnemy():void {
			for (var i:int=0; i<bulletListPlayer.length; i++) {
				for (var j:int=0; j<enemyList.length; j++) {
					if (enemyList[j].hitTestObject(bulletListPlayer[i])) {
						if (enemyList[j].state == 0) {
							enemyList[j].state = 1;
							removeInstance(bulletListPlayer[i]);
							bulletListPlayer.splice(i, 1);
							playerScore += 10;
							display.scoreText();
							i = 0;
							//j = null;
						}
					}
					if (enemyList[j].state == 2) {
						removeInstance(enemyList[j]);
						enemyList.splice(j, 1);
						//trace("Destroyed");
						//j = null;
					}
				}
			}
		}
		
		public function bulletCollisionPlayer():void {
			for (var i = bulletListEnemy.length - 1; i >= 0; i--) {
				if (player.hitTestObject(bulletListEnemy[i])) {
					removeInstance(bulletListEnemy[i]);
					bulletListEnemy.splice(i,1);
					player.bulletHit();
					display.damageText();
				}
			}
		}
		
		public function enemyCollisionPlayer():void {
			for (var i:int=0; i<enemyList.length; i++) {
				if (player.hitTestObject(enemyList[i])) {
					player.bulletHit();
					display.damageText();
					if (enemyList[i].state < 2) {
						enemyList[i].state = 1;
					}
				}
				if (enemyList[i].state == 2) {
					removeInstance(enemyList[i]);
					enemyList.splice(i, 1);
					trace("hello");
				}
			}
		}
		
		public function checkEnemyAlive():void {
			if(enemyList.length == 0) {
				addEnemies();
			}
		}
		
		public function updateEnemies():void {
			for (var i = enemyList.length - 1; i >= 0; i--) {
				enemyList[i].update();
			}
		}

		public function enemyShoot():void {
			for(var i:int=0; i<enemyList.length; i++){
				enemyList[i].cooldownTimer();
				var bullet:Bullet = enemyList[i].shootBullet();
				if(bullet != null) {
					addChild(bullet);
					setChildIndex(bullet, 0);
					bullet.x = enemyList[i].x;
					bullet.y = enemyList[i].y + 15;
					bullet.rotation = 90;
					enemyList[i].randomWeaponTemp();
					bulletListEnemy.push(bullet);
				}
			}
		}
		
		public function playerShoot():void {
			var bullet:Bullet = player.shootBullet();
			if(bullet != null) {
				addChild(bullet);
				bullet.x = player.x;
				bullet.y = player.y;
				bullet.rotation = 90;
				setChildIndex(bullet, 0);
				bulletListPlayer.push(bullet);
			}
		}
		
		public function enemyBulletPosition():void {
			for (var i = bulletListEnemy.length - 1; i >= 0; i--) {
				bulletListEnemy[i].enemyBullet();
				if (bulletListEnemy[i].removeBullet()) {
					removeInstance(bulletListEnemy[i]);
					bulletListEnemy.splice(i,1);
					i = null;
				}
			}
		}
		
		public function playerBulletPosition():void {
			for (var i = bulletListPlayer.length - 1; i >= 0; i--) {
				bulletListPlayer[i].playerBullet();
				if (bulletListPlayer[i].removeBullet()) {
					removeInstance(bulletListPlayer[i]);
					bulletListPlayer.splice(i,1);
					i = null;
				}
			}
		}
		
		public function stageBoundaries():void {
			if (player.x > 690) {
				player.x = 690;
			}
			if (player.x < 10) {
				player.x = 10;
			}
			if (player.y > 690) {
				player.y = 690;
			}
			if (player.y < 500) {
				player.y = 500;
			}
		}
		
		public function createBackground():void {
			if (Math.random() > 0.95) {
				particle = new Particle(this);
				addChild(particle);
				setChildIndex(particle, 0);
				particleList.push(particle);
			}
			if (particleList.length > maxParticles) {
				removeChild(particleList.shift());
			}
			for (var i = 0; i < particleList.length; i++) {
				particleList[i].update();
			}
		}
		
		private function removeInstance(someChild:DisplayObject):void {
			for (var i:int = 0; i < this.numChildren; i++) {
				if (this.getChildAt(i) === someChild) {
					this.removeChild(someChild);
				}
			}
		}
		
		private function keyDownHandler(event:KeyboardEvent):void {
			switch(event.keyCode) {
				case Keyboard.LEFT :
					left = true;
					break;
				case Keyboard.RIGHT :
					right = true;
					break;
				case Keyboard.UP :
					up = true;
					break;
				case Keyboard.DOWN :
					down = true;
					break;
				case Keyboard.SPACE :
					special = true;
					break;
				default:
				break;
			}
		}
		
		private function keyUpHandler(event:KeyboardEvent):void {
			switch(event.keyCode) {
				case Keyboard.LEFT :
					left = false;
					break;
				case Keyboard.RIGHT :
					right = false;
					break;
				case Keyboard.UP :
					up = false;
					break;
				case Keyboard.DOWN :
					down = false;
					break;
				case Keyboard.SPACE :
					special = false;
					break;
				default:
				break;
			}
		}
	}
}
