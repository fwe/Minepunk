package minepunk.worlds
{
	import minepunk.G;
	import minepunk.TextButton;
	
	import net.flashpunk.Engine;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	
	public class MainMenu extends World
	{
		private var menuItems:Vector.<String>;
		public function MainMenu()
		{
			super();
		}
		override public function begin():void
		{
			menuItems = new Vector.<String>();
			menuItems.push("New Game");
			menuItems.push("Credits");
			populateMenuItems();
			
			var title:TextButton = new TextButton("Minepunk", 400, 70, 68, null, null);
			title.x = G.halfWidth-title.halfWidthText;
			title.y = 130;
			title.static = true;
			add(title);
		}
		private function populateMenuItems() : void
		{
			var e:TextButton;
			var g:Text;
			for(var i:uint = 0; i < menuItems.length; i++)
			{
				var t:String = menuItems[i];
				e = new TextButton(menuItems[i], 300, 30, 24, menuClicked, i);
				e.x = G.halfWidth - e.halfWidthText;
				e.y = 290 + (i * 35);
				add(e);
			}
		}
		public function menuClicked (index:uint) : void 
		{
			switch (index) 
			{
				case 0:
					G.engine.startGame();
					break;
			}
		}
	}
}