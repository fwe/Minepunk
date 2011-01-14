package minepunk
{
	public class G
	{
		[Embed(source = "../assets/textures.png")] public static const PNG_TEXTURES:Class;
		
		public static const width:uint = 800;
		public static const height:uint = 480;
		public static const halfWidth:uint = width/2;
		public static const halfHeight:uint = height/2;
		public static const framerate:uint = 60;
		public static const tilesize:uint = 64;
		
		public static var map_length:uint = 60;
		public static var map_height:uint = 30;
		public static var engine:MineEngine;
	}
}