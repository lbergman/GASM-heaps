package gasm.heaps;

import gasm.heaps.components.HeapsSpriteComponent;
import gasm.heaps.systems.HeapsCoreSystem;
import gasm.core.IEngine;
import gasm.core.components.AppModelComponent;
import gasm.core.Context;
import gasm.core.Engine;
import gasm.core.Entity;
import gasm.core.ISystem;
import gasm.heaps.systems.HeapsRenderingSystem;
import gasm.heaps.systems.HeapsSoundSystem;
import hxd.App;
/**
 * ...
 * @author Leo Bergman
 */
class HeapsContext extends App implements Context {
    public var baseEntity(get, null):Entity;
    public var systems(default, null):Array<ISystem>;
    public var appModel(default, null):AppModelComponent;


    var _engine:IEngine;
    var _core:ISystem;
    var _renderer:ISystem;
    var _sound:ISystem;

    public function new(?core:ISystem, ?renderer:ISystem, ?sound:ISystem, ?engine:IEngine) {
        _core = core;
        _renderer = renderer;
        _sound = sound;
        _engine = engine;
        super();

        appModel = new AppModelComponent();
    }

    override function init() {
        _core = _core != null ? _core : new HeapsCoreSystem(s2d);
        _renderer = _renderer != null ? _renderer : new HeapsRenderingSystem(s2d);
        _sound = _sound != null ? _sound : new HeapsSoundSystem();
        systems = [_core, _renderer, _sound];
        _engine = _engine != null ? _engine : new Engine(systems);

        var comp = new HeapsSpriteComponent(cast s2d);
        baseEntity.add(comp);
        baseEntity.add(appModel);
        onResize();
    }

    override function onResize() {
        var stage = hxd.Stage.getInstance();
        appModel.stageSize.x = stage.width;
        appModel.stageSize.y = stage.height;
        appModel.resizeSignal.emit({width:appModel.stageSize.x, height:appModel.stageSize.y});
    }

    override function update(dt:Float) {
        _engine.tick();
    }

    public function get_baseEntity():Entity {
        return _engine.baseEntity;
    }

}