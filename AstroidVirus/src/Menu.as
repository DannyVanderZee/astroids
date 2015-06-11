package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class Menu extends Sprite
	{
		private var menuBackground : MenuBackgroundArt;
		private var menuStartButton : MenuStartButtonArt;
		
		public static const START : String = "gameStart";
		
		public function Menu() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			menuBackground = new MenuBackgroundArt();
			menuBackground.y = -400;
			
			menuStartButton = new MenuStartButtonArt();
			menuStartButton.x =  150;
			menuStartButton.y = -100;
			this.y = 400;
			
			menuStartButton.addEventListener(MouseEvent.CLICK, clicked);
			
			addChild(menuBackground);
			addChild(menuStartButton);
		}
		private function clicked(e:MouseEvent):void 
		{
			if (e.target == menuStartButton)
			{
				dispatchEvent(new Event(START));
			}
		}
	}
}