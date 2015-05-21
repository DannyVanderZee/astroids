package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.net.URLRequest;

	
	/**
	 * ...
	 * @author someweirdguy
	 */
	public class Main extends Sprite 
	{
		private var playerBact:Player;
		private var background:BackgroundArt = new BackgroundArt();
		[Embed(source="heartbeat441khz.mp3")]
		private var HeartBeat:Class;
		private var sound:Sound;
		
		
		
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event = null):void 
		{
			Start();
		}
		
		public function Start():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
			playerBact = new Player();
			addChild(playerBact);
			
			addChildAt(background,0);
			
			playerBact.y = stage.stageWidth * 0.5;
			playerBact.x = stage.stageHeight * 0.5;
			
			sound = new HeartBeat;
			sound.play();
			
		}
		
	}
	
}