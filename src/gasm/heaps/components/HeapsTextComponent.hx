package gasm.heaps.components;
import h2d.Font;
import h2d.Sprite;
import h2d.Text;
import hxd.Res;
import gasm.core.components.TextModelComponent;
import gasm.core.enums.ComponentType;


/**
 * ...
 * @author Leo Bergman
 */
class HeapsTextComponent extends HeapsSpriteComponent
{
	
	public var textField(default, null):Text;
	var _font:h2d.Font;
	var _fontId:Null<String>;
	var _text:String;
	var _showOutline:Bool;
	
	public function new(font:Null<h2d.Font>) 
	{
		_font = font;
		super();
		componentType = ComponentType.Text;
	}
	
	override public function init() 
	{
		textField = new Text(_font, sprite);
		textField.text = _text;
		if (_showOutline)
		{
			outline();
		}
	}
	
	public function outline(color:Int=0x000000, alpha:Float=1.0, blurX:Float=2.0, blurY:Float=2.0)
	{
		if (textField == null)
		{
			_showOutline = true;
		}
		else
		{			
			textField.dropShadow = {dy:blurX, dx:blurY, color:color, alpha:alpha};
		}
	}
	
	override public function update(delta:Float) 
	{
		super.update(delta);
		var model:TextModelComponent = owner.get(TextModelComponent);
		
		textField.text = model.text;
		if (_fontId == null)
		{
			_fontId = model.font;
		}
/*		if (_fontId != model.font)
		{
			_fontId = model.font;
			_font = Res.load(model.font).toFont().build(model.size);
			textField.font = _font;
		}		*/
		/*if (_font.size != model.size)
		{
			_font.resizeTo(model.size);
		}	*/	
		/*if (textField.textColor != model.color)
		{
			textField.textColor = model.color;
		}*/
	}
	
}