package gasm.heaps.systems;
import gasm.core.components.SpriteModelComponent;
import gasm.core.ISystem;
import h2d.col.Point;
import h2d.Scene;
import h2d.Sprite;
import gasm.core.Component;
import gasm.core.components.TextModelComponent;
import gasm.core.enums.ComponentType;
import gasm.core.System;
import gasm.core.enums.SystemType;
import gasm.heaps.components.HeapsSpriteComponent;
import gasm.heaps.components.HeapsTextComponent;

/**
 * ...
 * @author Leo Bergman
 */

class HeapsRenderingSystem extends System implements ISystem
{
	public var root(default, null):Scene;
	
	public function new(root:Scene)
	{
		this.root = root;
		type = SystemType.RENDERING;
		componentFlags.set(Graphics);
		componentFlags.set(Text);
	}
	
	public function update(comp:Component, delta:Float) 
	{
		if (!comp.inited)
		{		
			if (comp.componentType == Graphics || comp.componentType == Text)
			{
				var parent:HeapsSpriteComponent = comp.owner.parent.get(HeapsSpriteComponent);
				if (parent != null && parent != comp)
				{
					parent.sprite.addChild(cast(comp, HeapsSpriteComponent).sprite);
				}
				else
				{
					root.addChild(cast(comp, HeapsSpriteComponent).sprite);
				}
			}
			comp.init();
			comp.inited = true;
		}
		comp.update(delta);
	}
}