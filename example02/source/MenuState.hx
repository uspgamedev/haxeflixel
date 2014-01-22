import flash.Lib;
import flash.system.System;
import flash.events.Event;
import flash.events.KeyboardEvent;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxRandom;

class MenuState extends State {
    private var button: Button;

	override public function create(): Void {
        Lib.trace("MenuState: update: create");
		FlxG.cameras.bgColor = 0xff131c1b;

        #if mobile
        var str: String = "Tap to start the game.";
        #else
        var str: String = "Press SPACE to start the game.";
        #end

        str += "\nW: " + Lib.current.stage.stageWidth +
               " H: " + Lib.current.stage.stageHeight;
        var text: FlxText = new FlxText(20, 20, 600, str);
        text.color = 0xFFFFFF;
        text.size = 30;
        add(text);
        Lib.trace("MenuState: update: text added");

        button = new Button(300, 300, "Button", "button.png");
        add(button);

		super.create();
	}

	override public function destroy(): Void {
		super.destroy();
	}

	override public function update(): Void	{
        #if !mobile
        if (FlxG.keyboard.justReleased("SPACE")) {
            Lib.trace("MenuState: update: SPACE");
            switchState(new PlayState());
        }
        #end

        #if android
        for (touch in FlxG.touches.list) {
            if (touch.justPressed) {
                if (button.overlapsPoint(touch)) {
                    switchState(new PlayState());
                }
            }
        }
        #end

		super.update();
	}

    override public function onBackButton(event: KeyboardEvent): Void {
        // Get ESCAPE from keyboard or BACK from android.
        if (event.keyCode == 27) {
            #if android
            //event.stopImmediatePropagation();
            System.exit(0);
            #end
        }
    }
}
