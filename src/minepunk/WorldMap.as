package minepunk
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	public class WorldMap extends Entity
	{
		private var myMask:Grid;
		private var myTiles:Tilemap
		private var tileData:Vector.<Vector.<Vector.<int>>>;
		public function WorldMap()
		{
			super(0,0);
			
			mask = myMask = new Grid(G.width + (G.tilesize*2), G.height + (G.tilesize*2), G.tilesize, G.tilesize); //Margin of 1 block in either side
		}
		
		override public function added():void		
		{	
			init();
		}
		private function init () : void
		{
			type = "world";
			graphic = myTiles = new Tilemap(G.PNG_TEXTURES, G.width + (G.tilesize*2), G.height + (G.tilesize*2), G.tilesize, G.tilesize);
			
			for(var i:int = 0; i < 40; ++i)
			{
				for(var j:int = 0; j < 40; ++j)
				{
					myTiles.setTile(j, i, FP.rand(3));
				}
			}
		}
	}
}