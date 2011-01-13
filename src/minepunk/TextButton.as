package minepunk
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	
	public class TextButton extends Entity
	{
		private var _text:Text;
		private var _func:Function;
		private var _param:*;
		public var halfWidthText:int;
		public var halfHeightText:int;
		private var hovered:Boolean;
		private var _static:Boolean = false;
		public function TextButton(text:String, w:uint, h:uint, size:uint, func:Function, param:*)
		{
			_text = new Text(text, 0, 0, w, h);
			_text.size = size;
			_func = func;
			_param = param;
			halfWidthText = _text.width/2;
			halfHeightText = _text.height/2;
			
			setHitbox(_text.width, _text.height, 0, 0);
			super(0, 0, _text);
		}
		public function set static(n:Boolean) : void
		{
			_static = n;
		}
		override public function update():void
		{
			if(_static) return;
			if(collidePoint(x,y, Input.mouseX, Input.mouseY))
			{
				if(!hovered) {
					_text.color = 0xc9c9c9;
					hovered = true;
				}
				if(Input.mousePressed) 
				{
					_text.color = 0x666666;
					_func(_param);
				}
			} else 
			{
				hovered = false;
				_text.color = 0xffffff;
			}
		}
	}
}