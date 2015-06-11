package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Danny Van der Zee
	 */
	public class EnemySpawner extends MovieClip 
	{
		private var enemySpawnTimer:Number;
		private var enemySpawnTimerMax:Number;
		private var numberOfWhiteCells:int;
		private var _enemies:Array;
		public function EnemySpawner(enemies:Array) 
		{
			_enemies = enemies;
			init();
		}
		
		private function init():void 
		{
			enemySpawnTimerMax = 900;
			enemySpawnTimer = enemySpawnTimerMax;
			addEventListener(Event.ENTER_FRAME, spawnEvents);			
		}
		
		private function spawnEvents(e:Event):void 
		{
			enemySpawnTimer--;
			if (enemySpawnTimer == 0 && numberOfWhiteCells < 2)
			{
				//pick which side the enemy spawns on
				var randomSide:int = int(Math.random() * 4);
				numberOfWhiteCells = numberOfWhiteCells++;
				switch(randomSide)
				{
					case 0: spawnEnemyTop();
					break;
					
					case 1: spawnEnemyRight();
					break;
					
					case 2: spawnEnemyBottom();
					break;
					
					case 3: spawnEnemyLeft();
					break;
					
			
				}
				enemySpawnTimer = enemySpawnTimerMax;
			}
		}
		
		
		private function spawnEnemy(xPos:Number, yPos:Number)
		{
			var whiteEnemy:WhiteCells;
			whiteEnemy = new WhiteCells();
			whiteEnemy.x = xPos
			whiteEnemy.y = yPos
			addChild(whiteEnemy);
			
			_enemies.push(whiteEnemy);
			
		}
		
		private function spawnEnemyTop():void 
		{
			spawnEnemy(Math.random() * stage.stageWidth, -120	);
		}
		private function spawnEnemyRight():void 
		{
			spawnEnemy(stage.stageWidth + 30, Math.random() * 600);
		}
		
		private function spawnEnemyBottom():void 
		{
			spawnEnemy(Math.random() * stage.stageWidth, stage.stageHeight + 30);
		}
		
		private function spawnEnemyLeft():void 
		{
			spawnEnemy( -120, Math.random() * stage.stageHeight - 30);
		}
		
		
		
		
		
		
		
	}

}