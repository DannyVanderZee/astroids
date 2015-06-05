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
		
		private var bullet:Bullet;
		
		[Embed(source = "../lib/heartbeat441khz.mp3")]
		private var HeartBeat:Class; //sound of the heartbeat
		
		private var sound:Sound;
		private var menu : Menu;
		
		public var redEnemys:Array = [];
		public var bullets:Array = [];	
		
		
		private var k_counters:int;
		private var l_counters:int;
		
		
		
		
		public function Main() 
		
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
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
			function makeRedEnemyTimerListener (e:TimerEvent):void
			{
				newRedEnemy();
			}
			makeRedEnemyTimer.start(); //random timer for above ^
			
			bullet = new Bullet(0,0);
			
			playerBact = new Player();
			addChild(playerBact);	//player
			
			
			addChildAt(background,0); //background
			
			playerBact.y = stage.stageWidth * 0.5; //player size
			playerBact.x = stage.stageHeight * 0.5;
			
			sound = new HeartBeat; //music
			sound.play(0,9999);
			
			playerBact.addEventListener("shooting", shooting);
			bullet.addEventListener("removeBullet", removeBullet);
		}
		
		private function update(e:Event):void 
		{
			var j : int	= redEnemys.length;
			
			for (var l_counters:int = 0; l_counters < bullets.length; l_counters++) 
			{
				bullets[l_counters].Move(); //calls for the move function in script: Bullet.as
				
			}
			
			for (k_counters = j - 1; k_counters >= 0 ; k_counters--)
			{
				redEnemys[k_counters].update(); //calling update from redEnemy script? 
			
				for (l_counters = 0; l_counters < bullets.length; l_counters++)
				{
					
					//trace(redEnemys[k_counters]);
					//trace(bullets[l_counters]);
					if (redEnemys[k_counters].hitTestPoint(bullets[l_counters].x, bullets[l_counters].y, true)) //IK GA NOG RAGE`EN
					{
						
						trace("FUCK I GOT HIT!");
						
						removeChild(redEnemys[k_counters]);
						//
						
						splicerinoRed();
						removeBullet(e);
						//redEnemys.splice(redEnemys.indexOf(k), 1);
						
						//removeChild(bullets[i]);
						
						//bullets.splice(bullets.indexOf(i), i);
					}
				
				}
			  
			}
			
			
			
		}
		
		
		public function splicerinoRed():void
		{
			redEnemys.splice(redEnemys.indexOf(k_counters), 0);
			
			
		}
		
		public function shooting(e:Event):void
		{
			var bullet:Bullet = new Bullet(playerBact.x, playerBact.y);
				
			bullet.rotation = playerBact.rotation;
			bullet.x = playerBact.x; 
			bullet.y = playerBact.y;
				
			stage.addChild(bullet);
			bullets.push(bullet);
			//trace(bullets[l_counters]);
			
		}
		public function removeBullet(e:Event):void
		{
			bullets.splice(bullets.indexOf(l_counters), 1);
			trace("bullet is gespliced");
		}
		
		
		private function newRedEnemy():void
		{
			var newRedEnemy: RedEnemy = new RedEnemy();
			addChild(newRedEnemy);
			
			newRedEnemy.y = Math.random() * stage.stageWidth;
			redEnemys.push(newRedEnemy);
		}
		
	}
	
}