package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Danny Van der Zee
	 */
	public class WhiteCells extends Cell 
	{
		private var enemyArt:WhiteBloodCell;
		public function WhiteCells()
		{
			enemyArt = new WhiteBloodCell();
			this.addChild(enemyArt);
			
			this.width = 80;
			this.height = this.width;
			
			maxSpeed	=	10;
			mass		=	50;
		}
		
	}

}