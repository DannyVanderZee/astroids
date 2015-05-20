package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Swan Chase
	 */
	public class Bullet extends Sprite
	{
		private var playerBulletArt:PlayerBulletArt = new PlayerBulletArt() ;
		
		private var xSpeed:Number;
		private var ySpeed:Number;
		
		//private var velocity:Point = new Point();
		private const acceleration:int = 20;
		
		public function Bullet(xPos:int,yPos:int) 
		{
			addChild(playerBulletArt);
			this.x = xPos;
			this.y = yPos;
			this.xSpeed = xSpeed;
			this.ySpeed = ySpeed;
			
		}
		
		public function Move():void {
		var radians:Number = this.rotation * Math.PI / 180;;
			//move in the direction the ship is facing
			this.y += acceleration * Math.sin(radians);
			this.x += acceleration * Math.cos(radians);
		}
		
		/*public function BulletCheck() 
		{
			x += xSpeed;
			y += ySpeed;
		}*/
	}

}