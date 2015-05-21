package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.JPEGLoaderContext;
	
	/**
	 * ...
	 * @author someweirdguy
	 */
	public class Main extends Sprite 
	{
		private var playerBact:Player;
		private var background:BackgroundArt = new BackgroundArt();
		
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
			
			
			
		}
		
	}
	
}