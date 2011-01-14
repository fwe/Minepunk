package minepunk.worlds
{
	import minepunk.G;
	import minepunk.WorldMap;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	
	public class GameWorld extends World
	{
		private var map:WorldMap;
		private var px:int;
		private var py:int;
		public function GameWorld()
		{
			super();
		}
		override public function begin():void
		{
			FP.screen.color = 0x33ccff;
			add(map = new WorldMap());
		}
		override public function update():void 
		{
			super.update();
			
			px += (Input.mouseX - G.halfWidth) / 8;
			py += (Input.mouseY - G.halfHeight) / 8;
			
			px = FP.clamp(px, 0, map.mapLength - G.width);
			py = FP.clamp(py, 0, map.mapHeight - G.height);
			
			map.follow(px, py);
		}
	}
}