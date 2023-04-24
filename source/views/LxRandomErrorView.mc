import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class LxRandomErrorView extends View {
    (:initialized)
    private var _str as String;

    function initialize(str as String) {
        _str = str;
        View.initialize();
    }

    function onLayout(dc as Dc) {
        setLayout($.Rez.Layouts.Error(dc));
        var str = findDrawableById("String") as Text;
        str.setText(_str);
        var w = dc.getWidth();
        var h = dc.getHeight();
        switch (System.getDeviceSettings().screenShape) {
            case System.SCREEN_SHAPE_ROUND:
                str.setLocation(w * 0.15, h * 0.15);
                str.setSize(w * 0.7, h * 0.7);
        }
    }
}
