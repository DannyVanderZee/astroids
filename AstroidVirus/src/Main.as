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
		private var HeartBeat:Class;
		private var sound:Sound;
		
		private var redEnemys:Array;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event = null):void 
		{
			Start();
			addEventListener(Event.ENTER_FRAME, update);
			
			redEnemys = [];
		}
		
		public function Start():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var makeRedEnemyTimer:Timer = new Timer(1000, 0);
			
			makeRedEnemyTimer.addEventListener(TimerEvent.TIMER, makeRedEnemyTimerListener);
			
			function makeRedEnemyTimerListener (e:TimerEvent):void
			{
				newRedEnemy();
			}
			makeRedEnemyTimer.start();
			
			playerBact = new Player();
			addChild(playerBact);
			
			addChildAt(background,0);
			
			playerBact.y = stage.stageWidth * 0.5;
			playerBact.x = stage.stageHeight * 0.5;
			
			sound = new HeartBeat;
			sound.play();
			
		}
		
		private function update(e:Event):void 
		{
			var j : int	= redEnemys.length;
			
			for (var k : int = j - 1; k >= 0 ; k--)
			{
				redEnemys[k].update();
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