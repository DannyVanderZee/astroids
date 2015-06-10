package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Raymon Zoetigheid
	 */
	public class MainObject extends MovieClip
	{
		//private var counter:int = 0;
		public var forcedCounter:int = 0;
		public function MainObject() 
		{
			//ClassDiagram, moeten het wel OOP houden.
			
		}
		
		public function forcedMovement():void
		{
			
			forcedCounter++;
			if (forcedCounter < 50)
			{
				forcedCounter++;
				
				if (forcedCounter >= 35)
				{
					this.x = this.x + 3;
					
				}
				if (forcedCounter >= 49)
				{
					forcedCounter = 0;
					//trace("hartslag klaar");
				}
				
			}
			
		}
	}

}