package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author someweirdguy
	 */
	public class Main extends Sprite 
	{
		private var playerBact:Player;
		
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
			
			playerBact.y = stage.stageWidth * 0.5;
			playerBact.x = stage.stageHeight * 0.5;
			
			
			
		}
		
		
		
		
	}
	
}