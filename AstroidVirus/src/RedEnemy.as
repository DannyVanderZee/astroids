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
		
		private var _art:RedBloodCellArt;
		
		public function RedEnemy() 
		{
			_art = new RedBloodCellArt();
			addChild (_art);
			//this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update():void 
		{
			//x = x + 3;
			forcedMovement();
		}	
		
	}
}