package
{
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
		
		[Embed(source = "../lib/heartbeat441khz.mp3")]
		private var HeartBeat:Class; //sound of the heartbeat
		
		private var sound:Sound;
		private var menu : Menu;
		
		private var redEnemys:Array;
		
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
			
			redEnemys = []; //onnodige array wat je ook bij de variable declaration kan plaatsen?
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
			
			
			
			playerBact = new Player();
			addChild(playerBact);	//player
			
			addChildAt(background,0); //background
			
			playerBact.y = stage.stageWidth * 0.5; //player size
			playerBact.x = stage.stageHeight * 0.5;
			
			sound = new HeartBeat; //music
			sound.play();
			
		}
		
		private function update(e:Event):void 
		{
			var j : int	= redEnemys.length;
			
			for (var k : int = j - 1; k >= 0 ; k--)
			{
				redEnemys[k].update(); //calling update from redEnemy script? 
			}
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