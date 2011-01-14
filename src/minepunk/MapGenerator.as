package minepunk
{
	public class MapGenerator
	{
		public static function generateNewLevel () : Vector.<Vector.<Vector.<int>>>
		{
			var levelData:Vector.<Vector.<Vector.<int>>> = new Vector.<Vector.<Vector.<int>>>();
			var row:Vector.<Vector.<int>>;
			var cell:Vector.<int>;
			
			for(var i:int = 0; i < G.map_height; i++) //Create
			{
				row = levelData[i] = new Vector.<Vector.<int>>;	
				for(var j:int = 0; j < G.map_length; j++)
				{
					cell = row[j] = new Vector.<int>(2, true); // 0 - Type of block, 1 - Durability (0 = most durable)
				}
			}
			for(i = 0; i < G.map_height; i++) //Populate
			{
				row = levelData[i];
				for(j = 0; j < G.map_length; j++)
				{
					cell = row[j] = createMapBlock(i,j, levelData);
				}
			}
			
			return levelData;
		}
		
		private static function createMapBlock(row:int, column:int, levelData:Vector.<Vector.<Vector.<int>>>) : Vector.<int>
		{
			if(row < 10)              return getBlock(GBlocks.EMPTY);
			if(row < 12)              return getBlock(GBlocks.GRASS);
			if(row < 17)              return getBlock(GBlocks.DIRT);
			return getBlock(GBlocks.SMOOTHSTONE);
			
			return getBlock(GBlocks.EMPTY);
		}
		private static function getBlock(type:int) : Vector.<int>
		{
			var blk:Vector.<int> = new Vector.<int>(2, true);
			switch(type)
			{
				case GBlocks.EMPTY:
					blk[0] = 0;
					break;
				case GBlocks.GRASS:
					blk[0] = 1;
					blk[1] = 4;
					break;
				case GBlocks.DIRT:
					blk[0] = 3;
					blk[1] = 9;
					break;
				case GBlocks.SMOOTHSTONE:
					blk[0] = 4;
					blk[1] = 16;
					break;
			}
			return blk;
		}
	}
}