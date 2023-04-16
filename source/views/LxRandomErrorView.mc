import Toybox.Graphics;
import Toybox.Lang;
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
        (findDrawableById("String") as Text).setText(_str);
    }
}
