package minepunk.worlds
{
	import minepunk.WorldMap;
	
	import net.flashpunk.World;
	
	public class GameWorld extends World
	{
		public function GameWorld()
		{
			super();
		}
		override public function begin():void
		{
			add(new WorldMap());
		}
	}
}