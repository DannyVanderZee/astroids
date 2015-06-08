package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Danny Van der Zee
	 */
	public class WhiteCells extends MovieClip 
	{
		private var enemyArt:EnemyPArt;
		public function WhiteCells()
		{
			enemyArt = new EnemyPArt();
			this.addChild(enemyArt);
			
			
		}
		
		
		
		
		
	}

}