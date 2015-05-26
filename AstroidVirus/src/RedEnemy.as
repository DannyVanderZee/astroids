package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class RedEnemy extends Sprite
	{
		
		private var asset:RedBloodCellArt;
		
		public function RedEnemy() 
		{
			asset = new RedBloodCellArt();
			addChild (asset);
			//this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function update():void 
		{
			x = x + 3;
		}	
	}
}