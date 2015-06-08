package  
{
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Raymon Zoetigheid
	 */
	public class ScoreBoard extends TextField
	{
		public var score:int;
		
		public function ScoreBoard() 
		{
			score = 0;
			var textFormat:TextFormat = new TextFormat();
			textFormat.size = 20;
			//textFormat.font = "comic sans";
			this.defaultTextFormat = textFormat;
			this.text = "score : 0";
			this.width = 150;
			mouseEnabled = false;
			this.textColor = 0xFFFFFF;
			
		}
		
		public function updateScore(_score:int):void
		{
			score += _score;
			this.text = "score : " + score;
			
		}
	}

}