package  
{
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Raymon Zoetigheid
	 */
	public class Player extends MovieClip
	{
		private var placeholderArt:PlaceHolderAsset;
		
		private const maxSpeed:int = 20;
		private const acceleration:int = 1;
		private const rotation1:int = 10;
		private const friction:Number = 0.85;
		private var velocity:Point = new Point();
		
		private var upKey:Boolean = false;
		private var downKey:Boolean = false;
		private var leftKey:Boolean = false;
		private var rightKey:Boolean = false;
		
		private var counter:int = 0;
		
		public function Player() 
		{
			placeholderArt = new PlaceHolderAsset();
			this.addChild(placeholderArt);
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, kDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, kUp);
			
			addEventListener(Event.ENTER_FRAME, loop);
			
		}
		
		private function kDown(k:KeyboardEvent):void
		{
				if (k.keyCode == 37) //Left arrowkey
				{
					leftKey = true;
				}
				if (k.keyCode == 38) //up arrowkey
				{
					upKey = true;
				}
				if (k.keyCode == 39) //right arrowkey
				{
					rightKey = true;
				}
				if (k.keyCode == 40) //down arrowkey
				{
					downKey = true;
				}
		}
		private function kUp(k:KeyboardEvent):void
		{
				if (k.keyCode == 37) //Left arrowkey
				{
					leftKey = false;
				}
				if (k.keyCode == 38) //up arrowkey
				{
					upKey = false;
				}
				if (k.keyCode == 39) //right arrowkey
				{
					rightKey = false;
				}
				if (k.keyCode == 40) //down arrowkey
				{
					downKey = false;
				}
		}
		private function loop(e:Event):void
		{
			counter++;
				if (upKey) 
				{ 
					velocity.y += acceleration * Math.sin(this.rotation / 180 * Math.PI);
					velocity.x += acceleration * Math.cos(this.rotation / 180 * Math.PI);
				}
				else if (downKey) 
				{ 
					velocity.y -= acceleration * Math.sin(this.rotation / 180 * Math.PI);
					velocity.x -= acceleration * Math.cos(this.rotation / 180 * Math.PI);
				}
				else
				{
					velocity.x *= friction;
					velocity.y *= friction;
					
				}
				
				if (rightKey) this.rotation += rotation1;
				if (leftKey) this.rotation -= rotation1;
				
				this.x += velocity.x;
				this.y += velocity.y;
				
				
				
				
				if (this.x < 0) this.x = stage.stageWidth;
				if (this.x > stage.stageWidth) this.x = 0;
				if (this.y < 0) this.y = stage.stageHeight;
				if (this.y > stage.stageHeight) this.y = 0;
				
				var spd:Number = Math.sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y));
				
				if (spd > maxSpeed) //zodat hij niet harder gaat dan 20
				{
					velocity.y *= (maxSpeed / spd);
					velocity.x *= (maxSpeed / spd);
					
				}
				
				if (counter >= 60)
				{
					this.x += 10;
					
					if (counter == 80)
					{
						counter = 0;
					}
				}
				
		}
		
		
		
	}

}