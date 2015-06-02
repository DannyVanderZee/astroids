package  
{
 import flash.display.Sprite;
 import flash.events.Event;
 import Main;
 /**
  * ...
  * @author Swan Chase
  */
	public class Bullet extends MainObject
	{
		private var playerBulletArt:PlayerBulletArt = new PlayerBulletArt() ;
		private var deathTimer:Number = 0;
		private var xSpeed:Number;
		private var ySpeed:Number;
		private const acceleration:int = 20;

	public function Bullet(xPos:int,yPos:int) 
	{
		addChild(playerBulletArt);
		this.x = xPos;
		this.y = yPos;
		this.xSpeed = xSpeed;
		this.ySpeed = ySpeed;
		addEventListener(Event.ENTER_FRAME, loop);
		
		
		
		
		
	}

	public function Move():void 
	{
		var radians:Number = this.rotation * Math.PI / 180;
		//move in the direction the ship is facing
		this.y += acceleration * Math.sin(radians);
		this.x += acceleration * Math.cos(radians);
		
		deathTimer++;
		if (deathTimer == 40) // makes sure they dont exist forever.
		{
			//removeChild(playerBulletArt);
		}
		
		
		/*if (this.hitTestObject(Main.redEnemys[k]))
		{
				trace("ik word echt geraakt : O ");
			
		}*/
		
		
	}
		private function loop(e:Event):void 
		{
			if (this.x < 0) this.x = stage.stageWidth; //screen moving. Can become OOP. in the mainobject
			if (this.x > stage.stageWidth) this.x = 0;
			if (this.y < 0) this.y = stage.stageHeight;
			if (this.y > stage.stageHeight) this.y = 0;
		}
	}
}