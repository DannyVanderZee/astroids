package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	//import MainObject;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class RedEnemy extends MainObject
	{
		
		private var _art:redCellArt;
		
		public function RedEnemy() 
		{
			_art = new redCellArt();
			addChild (_art);
			//this.addEventListener(Event.ENTER_FRAME, update);
			this.width = 75;
			this.height = this.width;
		}
		
		public function update():void 
		{
			x = x + 5;
			//forcedMovement();
			this.rotation += 4;
		}	
	}
}