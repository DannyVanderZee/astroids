package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Berend Weij
	 */
	public class Main extends Sprite 
	{
		
		private var _paraglider : Paraglider;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
			_paraglider = new Paraglider();
			
			addChild(_paraglider);
			
			stage.addEventListener(MouseEvent.CLICK, setTarget);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function setTarget(e:MouseEvent):void 
		{
			_paraglider.setTarget( new Vector2D(e.stageX, e.stageY) );
		}
		
		private function update(e : Event) : void
		{
			_paraglider.update();
		}
		
	}
	
}