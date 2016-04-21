package gasm.heaps.components;

import gasm.core.components.SpriteModelComponent;
import h2d.comp.Button;
import h2d.Sprite;
import gasm.core.Component;
import gasm.core.enums.ComponentType;

/**
 * ...
 * @author Leo Bergman
 */
class HeapsSpriteComponent extends Component
{
	public var sprite(default, default):Sprite;
	public function new(?sprite:Null<Sprite> = null) 
	{
		if (sprite == null)
		{
			sprite = new Sprite();
		}
		this.sprite = sprite;
		componentType = ComponentType.Graphics;
	}
	
	override public function init()
	{
		var model = owner.get(SpriteModelComponent);
		model.width = sprite.getBounds().width;
		model.height = sprite.getBounds().height;
		if (model.interactive)
		{
			/*var btn = new Button();
			sprite.parent.addChild(btn);
			sprite.remove();
			btn.addChild(sprite);
			btn.onClick = function(e:MouseEvent) {
				if(model.pressHandler != null)
				{
					model.pressHandler(new PressEvent( { x:sprite.mouseX, y:sprite.mouseY }, owner));
				}
			};
			btn.onMouseOver = function(e:MouseEvent)
			{
				if(model.overHandler != null)
				{
					model.overHandler(new OverEvent( { x:sprite.mouseX, y:sprite.mouseY }, owner));
				}
			};*/
		}
		
	}
	
	override public function update(dt:Float) 
	{
		var model = owner.get(SpriteModelComponent);
		sprite.x = model.x + model.offsetX;
		sprite.y = model.y + model.offsetY;
	}
	
}