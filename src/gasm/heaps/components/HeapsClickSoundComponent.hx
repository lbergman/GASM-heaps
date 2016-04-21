package gasm.heaps.components;
import openfl.display.DisplayObject;
import openfl.events.MouseEvent;
import openfl.media.Sound;
import gasm.core.Component;
import gasm.core.enums.ComponentType;

/**
 * ...
 * @author Leo Bergman
 */
class HeapsClickSoundComponent extends Component
{
	
	public function new() 
	{
		type = ComponentType.Sound;
	}

	override public function init() 
	{
		var spriteComp = owner.get(HeapsSpriteComponent);
		var sprite:DisplayObject = spriteComp.sprite;
		sprite.addEventListener(MouseEvent.CLICK,
			function(e:MouseEvent)
			{
				var soundComp = owner.get(HeapsSoundComponent);
				soundComp.sound.play();
			}
		);
		super.init();
	}
}