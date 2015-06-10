package  
{
 import flash.display.MovieClip;
 import flash.display.Sprite;
 import flash.events.Event;
 /**
  * ...
  * @author Swan Chase
  */
	public class Bullet extends MovieClip
	{
		private var playerBulletArt:kogelAnimatie = new kogelAnimatie() ;
		private var deathTimer:Number = 0;
		private var xSpeed:Number;
		private var ySpeed:Number;
		private const acceleration:int = 20;
		
		public static const REMOVE_BULLET = "removeBullet";
	public function Bullet(xPos:int,yPos:int) 
	{
		addChild(playerBulletArt);
		this.x = xPos;
		this.y = yPos;
		this.xSpeed = xSpeed;
		this.ySpeed = ySpeed;
		addEventListener(Event.ENTER_FRAME, loop);
		
		this.width = 25;
		this.height = this.width;
	}

	public function Move():void 
	{
		var radians:Number = this.rotation * Math.PI / 180;;
		//move in the direction the ship is facing
		this.y += acceleration * Math.sin(radians);
		this.x += acceleration * Math.cos(radians);
		
		deathTimer++;
		if (deathTimer == 40)
		{
			//removeChild(playerBulletArt);
			trace("deathTimer afgelopen");
			
			this.dispatchEvent(new Event(REMOVE_BULLET));
		}
	}
		private function loop(e:Event):void
		{
			
			if (this.x < 0) this.x = stage.stageWidth;
			if (this.x > stage.stageWidth) this.x = 0;
			if (this.y < 0) this.y = stage.stageHeight;
			if (this.y > stage.stageHeight) this.y = 0;
		}
		
		public function destroy():void
		{
			removeEventListener(Event.ENTER_FRAME,loop);
		}
	}
}