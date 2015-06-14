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
		private var menuBackground : background;
		private var menuStartButton : MenuStartButtonArt;
		private var menuOptionsButton : MenuOptionsButtonArt;
		private var menuOptionsMenu : optionsMenu;
		
		public static const START : String = "gameStart";
		
		public function Menu() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event = null):void 
		{
			
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			menuBackground = new background();
			menuBackground.y = -400;
			
			menuOptionsMenu = new optionsMenu;
			menuOptionsMenu.y = -400;
			menuOptionsMenu.width = 800;
			menuOptionsMenu.height = 600;
			
			menuOptionsButton = new MenuOptionsButtonArt();
			menuOptionsButton.x = 450;
			menuOptionsButton.y = -100;
			menuOptionsButton.scaleX = 0.7;
			menuOptionsButton.scaleY = 0.75;
			
			
			menuStartButton = new MenuStartButtonArt();
			menuStartButton.x =  50;
			menuStartButton.y = -100;
			menuStartButton.scaleX = 0.7;
			menuStartButton.scaleY = 0.7;
			this.y = 400;
			
			menuStartButton.addEventListener(MouseEvent.CLICK, clicked);
			menuOptionsButton.addEventListener(MouseEvent.CLICK, click);
			menuOptionsMenu.addEventListener(MouseEvent.CLICK, inOptionsClick);
			
			addChild(menuBackground);
			addChild(menuStartButton);
			addChild(menuOptionsButton);
			addChild(menuOptionsMenu);
			menuOptionsMenu.visible = false;
			
		}
		
		private function inOptionsClick(e:MouseEvent):void 
		{
			if (e.target == menuOptionsMenu)
			{
				menuBackground.visible = true;
				menuOptionsButton.visible = true;
				menuStartButton.visible = true;
				menuOptionsMenu.visible = false;
			}
		}
		
		private function click(e:MouseEvent):void 
		{
			if (e.target == menuOptionsButton)
			{
				menuBackground.visible = false;
				menuOptionsButton.visible = false;
				menuStartButton.visible = false;
				menuOptionsMenu.visible = true;
			}
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