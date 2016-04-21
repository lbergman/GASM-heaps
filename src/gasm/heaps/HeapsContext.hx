package gasm.heaps;
import gasm.core.ISystem;
import hxd.App;
import gasm.core.Context;
import gasm.core.Engine;
import gasm.core.Entity;
import gasm.core.enums.SystemType;
import gasm.core.System;
import gasm.heaps.systems.HeapsRenderingSystem;
import gasm.heaps.systems.HeapsSoundSystem;
/**
 * ...
 * @author Leo Bergman
 */
class HeapsContext extends App implements Context
{
	public var baseEntity(get, null):Entity;
	public var systems(default, null):Array<ISystem>;

	var _engine:Engine;
	
	public function new() 
	{
		super();
	}
	
	override function init() 
	{
		super.init();
		var renderer = new HeapsRenderingSystem(s2d);
		var sound = new HeapsSoundSystem();
		systems = [renderer, sound];
		_engine = new Engine(systems);
	}
	
	override function update(dt:Float) 
	{
		_engine.tick();
	}
	
	public function get_baseEntity():Entity
	{
		return _engine.baseEntity;
	}
	
}