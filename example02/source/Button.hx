import flixel.util.FlxPoint;
import flixel.text.FlxText;
import flixel.group.FlxGroup;

class Button extends FlxGroup {
    private var label: String;
    private var text: FlxText;
    private var background: Sprite;

    public function new(X: Float = 0, Y: Float = 0, _label: String = "",
                        _background: String = "") {
        super();

        label = _label;
        background = new Sprite(X, Y, _background);
        background.setAnchor(background.width / 2, background.height / 2);

        text = new FlxText(0, 0, cast(background.width, Int), label);

        add(background);
        add(text);
    }

    public function overlapsPoint(point: FlxPoint): Bool {
        return background.overlapsPoint(point);
    }

    public function getPosition(): FlxPoint {
        return background.getPosition();
    }

    public function setX(X: Float): Float {
        return background.setX(X);
    }

    public function getX(): Float {
        return background.getX();
    }

    public function setY(Y: Float): Float {
        return background.setY(Y);
    }

    public function getY(): Float {
        return background.getY();
    }
}
