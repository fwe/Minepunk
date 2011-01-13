package minepunk
{
	import minepunk.worlds.MainMenu;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class MineEngine extends Engine
	{
		public function MineEngine()
		{
			super(G.width, G.height, G.framerate);
			
			G.engine = this;
		}
		
		override public function init():void
		{
			FP.console.enable();
			FP.console.visible = true;
			FP.world = new MainMenu;
		}
		
		public function startGame () : void
		{
			trace("Start Game!");
		}
	}
}