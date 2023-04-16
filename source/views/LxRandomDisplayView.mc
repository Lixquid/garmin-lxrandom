import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class LxRandomDisplayView extends View {
    (:initialized)
    private var _height as Number;
    (:initialized)
    private var _type as String;
    (:initialized)
    private var _subType as String;

    (:initialized)
    private var _lblResult as Text;
    (:initialized)
    private var _lblOldResult as Text;
    (:initialized)
    private var _lblOldResult2 as Text;
    (:initialized)
    private var _lblOldResult3 as Text;

    private var _oldResult = "";
    private var _oldResult2 = "";
    private var _oldResult3 = "";

    function initialize(type as String, subType as String) {
        View.initialize();
        _type = type;
        _subType = subType;
    }

    function onLayout(dc as Dc) {
        setLayout($.Rez.Layouts.Display(dc));

        (findDrawableById("Type") as Text).setText(_type);
        (findDrawableById("SubType") as Text).setText(_subType);
        _height = dc.getHeight();

        _lblResult = findDrawableById("Result") as Text;
        _lblOldResult = findDrawableById("OldResult") as Text;
        _lblOldResult2 = findDrawableById("OldResult2") as Text;
        _lblOldResult3 = findDrawableById("OldResult3") as Text;

        _lblOldResult.setLocation(_lblOldResult.locX, _height * 0.8);
        _lblOldResult2.setLocation(_lblOldResult2.locX, _height * 0.9);
        _lblOldResult3.setLocation(_lblOldResult3.locX, _height * 1.05);

        var a = Storage.getValue(LX_S_VIEWSTATE_PREFIX + _type + _subType) as Array<String>?;
        if (a != null) {
            _oldResult = a[0];
            _oldResult2 = a[1];
            _oldResult3 = a[2];
            _lblOldResult2.setText(_oldResult3);
            _lblOldResult.setText(_oldResult2);
            _lblResult.setText(_oldResult);
        }
    }

    function pushResult(result as String) {
        _lblOldResult3.setText(_oldResult3);
        _lblOldResult2.setText(_oldResult2);
        _lblOldResult.setText(_oldResult);
        _lblResult.setText(result);
        _oldResult3 = _oldResult2;
        _oldResult2 = _oldResult;
        _oldResult = result;
        Storage.setValue(LX_S_VIEWSTATE_PREFIX + _type, [_oldResult, _oldResult2, _oldResult3]);

        WatchUi.animate(_lblOldResult, :locY, WatchUi.ANIM_TYPE_EASE_OUT, _height * 0.7, _height * 0.8, 1, null);
        WatchUi.animate(_lblOldResult2, :locY, WatchUi.ANIM_TYPE_EASE_OUT, _height * 0.8, _height * 0.9, 1, null);
        WatchUi.animate(_lblOldResult3, :locY, WatchUi.ANIM_TYPE_EASE_OUT, _height * 0.9, _height * 1.05, 1, null);
    }
}

class LxRandomDisplayViewDelegate extends BehaviorDelegate {
    (:initialized)
    private var _view as LxRandomDisplayView;
    (:initialized)
    private var _generator as LxRandomGeneratorAbstract;

    function initialize(view as LxRandomDisplayView, generator as LxRandomGeneratorAbstract) {
        BehaviorDelegate.initialize();
        _view = view;
        _generator = generator;
    }

    function onSelect() as Boolean {
        _view.pushResult(_generator.getValue());
        return true;
    }
}
