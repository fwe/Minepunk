package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import minepunk.MineEngine;
	
	import net.flashpunk.FP;
	
	[SWF(width=800,height=480)]
	
	public class Minepunk extends Sprite
	{
		public function Minepunk()
		{
			if(stage)
				init();
			else
				addEventListener (Event.ADDED_TO_STAGE, init);
		}
		private function init (e:Event = null) : void
		{
			addChild ( new MineEngine () );
		}
	}
}