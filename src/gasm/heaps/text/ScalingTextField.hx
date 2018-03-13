package gasm.heaps.text;

class ScalingTextField extends h2d.Text {
    public function new(font:h2d.Font, ?parent) {
        super(font, parent);
    }
    public inline function scaleToFit(w:Float) {
        while(getSize().width > w) {
            scale(scaleX-0.00001);
        }
    }
}
