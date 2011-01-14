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
		private var levelData:Vector.<Vector.<Vector.<int>>>;
		public var mapLength:int;
		public var mapHeight:int;
		private var xblocks:int;
		private var yblocks:int;
		private var mapX:int;
		private var mapY:int;
		private var mapXblock:int;
		private var mapYblock:int;
		private var lastRenderX:int = 99;
		private var lastRenderY:int = 99;
		public function WorldMap()
		{
			super(0,0);
			
			mask = myMask = new Grid(100, 100, G.tilesize, G.tilesize); //Overwritten later
		}
		
		override public function added():void		
		{	
			init();
		}
		private function init () : void
		{
			type = "world";
			
			
			initLevelData ();
			updateWorld ();
		}
		private function initLevelData () : void
		{			
			levelData = MapGenerator.generateNewLevel();
			
			mapLength = G.map_length * G.tilesize;
			mapHeight = G.map_height * G.tilesize;
			xblocks = Math.ceil(G.width / G.tilesize) + 2;  //Margin
			yblocks = Math.ceil(G.height / G.tilesize) + 2;
			
			graphic = myTiles = new Tilemap(G.PNG_TEXTURES, xblocks*G.tilesize, yblocks*G.tilesize, G.tilesize, G.tilesize);
			myMask.width = xblocks*G.tilesize, myMask.height = yblocks*G.tilesize;
		}
		public function follow(tx:int, ty:int, ease:Number = 1) : void
		{
			//tx += G.halfWidth, ty += G.halfHeight;
			tx = FP.clamp(tx, 0, mapLength - G.width);
			ty = FP.clamp(ty, 0, mapHeight - G.height);
			
			x = (-tx%G.tilesize) - G.tilesize;
			y = (-ty%G.tilesize) - G.tilesize;
			
			mapXblock = tx/G.tilesize;
			mapYblock = ty/G.tilesize;
			
			updateWorld ();
		}
		private function updateWorld () : void
		{
			var row:int;
			var column:int;
			var cell:Vector.<int>;
			if(lastRenderX == mapXblock && lastRenderY == mapYblock) return;
			lastRenderX = mapXblock, lastRenderY = mapYblock;
			for(var i:int = 0; i < yblocks; i++)
			{
				row = mapYblock + i;
				row < G.map_height ? null : row = G.map_height-1;
				
				for(var j:int = 0; j < xblocks; j++)
				{
					column = mapXblock + j;
					column < G.map_length ? null : column = G.map_length-1;
	
					cell = levelData[row][column];
					
					if(cell[0])
						myTiles.setTile(j, i,cell[0]);
					else
						myTiles.clearTile(j, i);
				}
			}
		}
	}
}