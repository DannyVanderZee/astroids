package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Raymon Zoetigheid
	 */
	public class MainObject extends Sprite
	{
		//private var counter:int = 0;
		public function MainObject() 
		{
			//ClassDiagram, moeten het wel OOP houden.
			
		}
		
		public function forcedMovement(e:Event):void
		{
			var counter:int = 0;
			counter++;
			if (counter >= 60)
			{
				this.x += 10;
				
				if (counter == 80)
				{
					counter = 0;
					if (counter >= 20) //de hartslag beat
					{
						this.x += 6;
						
						if (counter == 28)
						{
							counter = 0;
						}
					}
				}
			}
			
		}
	}

}