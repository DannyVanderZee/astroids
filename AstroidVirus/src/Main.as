package
{
	import flash.display.AVM1Movie;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author someweirdguy
	 */
	public class Main extends Sprite
	{
		private var playerBact:Player;
		private var background:BackgroundArt = new BackgroundArt();
		
		//private var bullet:Bullet;
		private var spawner:EnemySpawner;
		
		[Embed(source="../lib/heartbeat441khz.mp3")]
		private var HeartBeat:Class; //sound of the heartbeat
		
		private var sound:Sound;
		private var menu:Menu;
		
		public var redEnemys:Array = [];
		public var bullets:Array = [];
		
		public var scoreBoard:ScoreBoard;
		
		//private var k_counters:int;
		//private var l_counters:int;
		
		public function Main()
		
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		
		}
		
		private function init(e:Event = null):void
		{
			menu = new Menu();
			addChild(menu);
			
			menu.addEventListener(Menu.START, StartGame);
			
			addEventListener(Event.ENTER_FRAME, update);
		
			//redEnemys = []; //onnodige array wat je ook bij de variable declaration kan plaatsen?
		}
		
		private function StartGame(e:Event):void
		{
			Start();
		}
		
		public function Start():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			removeChild(menu);
			
			var makeRedEnemyTimer:Timer = new Timer(1000, 0); //RedBloodcell spawning randomizer. 
			makeRedEnemyTimer.addEventListener(TimerEvent.TIMER, makeRedEnemyTimerListener);
			function makeRedEnemyTimerListener(e:TimerEvent):void
			{
				newRedEnemy();
			}
			makeRedEnemyTimer.start(); //random timer for above ^
			
			//bullet = new Bullet(0,0);
			
			playerBact = new Player();
			addChild(playerBact); //player
			
			spawner = new EnemySpawner();
			addChild(spawner); //white cell
			
			addChildAt(background, 0); //background
			
			playerBact.y = stage.stageWidth * 0.5; //player size
			playerBact.x = stage.stageHeight * 0.5;
			
			scoreBoard = new ScoreBoard();
			addChild(scoreBoard);
			
			sound = new HeartBeat; //music
			sound.play(0, 9999);
			
			playerBact.addEventListener("shooting", shooting);
			//bullet.addEventListener("removeBullet", removeBullet);
		}
		
		private function update(e:Event):void
		{
			var j:int = redEnemys.length;
			
			for (var i:int = 0; i < bullets.length; i++)
			{
				bullets[i].Move(); //calls for the move function in script: Bullet.as
				
			}
			
			for (var k:int = j - 1; k >= 0; k--)
			{
				redEnemys[k].update(); //calling update from redEnemy script? 
				
				for (i = 0; i < bullets.length; i++)
				{
					if (redEnemys[k].hitTestPoint(bullets[i].x, bullets[i].y, true)) //IK GA NOG RAGE`EN
					{
						trace("FUCK I GOT HIT!");
						
						splicerinoRed(redEnemys[k]);
						removeBullet(bullets[i]);
							//continue;
					}
					
				}
				
			}
		
		}
		
		public function splicerinoRed(redEnemy:RedEnemy):void
		{
			if (this.contains(redEnemy))
			{
				removeChild(redEnemy);
			}
			redEnemys.splice(redEnemys.indexOf(redEnemy), 1);
			
			scoreBoard.updateScore(10);
		
		}
		
		public function removeBullet(bullet:Bullet):void
		{
			trace("bullet wordt gespliced");
			
			if (this.contains(bullet))
			{
				bullet.destroy();
				removeChild(bullet);
			}
			bullets.splice(bullets.indexOf(bullet), 1);
			
			bullet.removeEventListener(Bullet.REMOVE_BULLET, handleBulletRemoval);
			
		
		}
		
		public function shooting(e:Event):void
		{
			var bullet:Bullet = new Bullet(playerBact.x, playerBact.y);
			
			bullet.rotation = playerBact.rotation;
			bullet.x = playerBact.x;
			bullet.y = playerBact.y;
			
			addChild(bullet);
			bullets.push(bullet);
			//trace(bullets[l_counters]);
			trace(bullets.length);
			
			bullet.addEventListener(Bullet.REMOVE_BULLET, handleBulletRemoval);
		
		}
		
		private function handleBulletRemoval(e:Event):void
		{
			trace("timer");
			removeBullet(e.target as Bullet);
		
		}
		
		private function newRedEnemy():void
		{
			var newRedEnemy:RedEnemy = new RedEnemy();
			addChild(newRedEnemy);
			
			newRedEnemy.y = Math.random() * stage.stageWidth;
			redEnemys.push(newRedEnemy);
		}
	
	}

}