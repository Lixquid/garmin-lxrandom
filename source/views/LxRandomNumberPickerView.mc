import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

typedef LxRandomNumberPickerViewInitializeProps as {
    :min as Number?,
    :max as Number?,
    :title as Symbol,
    :initial as Number,
    :callback as (Method(val as Number) as Void),
};

class LxRandomNumberPickerView extends View {
    (:initialized)
    var props as LxRandomNumberPickerViewInitializeProps;
    var screenHeight as Number = 0;
    var increment as Number = 1;
    var value as Number = 0;

    private var _valueLabel as Text?;

    function initialize(propsI as LxRandomNumberPickerViewInitializeProps) {
        View.initialize();
        props = propsI;
        value = propsI.get(:initial);
    }

    function onLayout(dc as Dc) {
        setLayout($.Rez.Layouts.NumberPicker(dc));
        (findDrawableById("Title") as Text).setText(props[:title]);
        _valueLabel = findDrawableById("Value");
        screenHeight = dc.getHeight();
    }

    function onUpdate(dc as Dc) {
        if (_valueLabel != null) {
            _valueLabel.setText(value.toString());
        }
        View.onUpdate(dc);
    }

    function setValue(newValue as Number) {
        value =
            props.hasKey(:min) && newValue < props[:min]
                ? props[:min]
                : props.hasKey(:max) && newValue > props[:max]
                ? props[:max]
                : newValue;
        WatchUi.requestUpdate();
    }
}

class LxRandomNumberPickerViewDelegate extends InputDelegate {
    (:initialized)
    private var _view as LxRandomNumberPickerView;
    private var _dragOffset = 0;
    private const DRAG_AMT = 40;

    function initialize(view as LxRandomNumberPickerView) {
        InputDelegate.initialize();
        _view = view;
    }

    function onKey(keyEvent as KeyEvent) as Boolean {
        switch (keyEvent.getKey()) {
            case KEY_ENTER:
                _view.props[:callback].invoke(_view.value);
                WatchUi.popView(SLIDE_RIGHT);
                return true;
            case KEY_UP:
                _view.setValue(_view.value + _view.increment);
                return true;
            case KEY_DOWN:
                _view.setValue(_view.value - _view.increment);
                return true;
            case KEY_ESC:
                WatchUi.popView(SLIDE_RIGHT);
                return true;
        }
        return false;
    }

    function onTap(ev as ClickEvent) as Boolean {
        var y = ev.getCoordinates()[1];
        if (y < _view.screenHeight / 2) {
            _view.setValue(_view.value + _view.increment);
        } else {
            _view.setValue(_view.value - _view.increment);
        }
        return true;
    }

    function onDrag(ev as DragEvent) as Boolean {
        var y = ev.getCoordinates()[1];
        switch (ev.getType()) {
            case DRAG_TYPE_START:
                _dragOffset = y;
                return true;
            case DRAG_TYPE_CONTINUE:
                if (y - _dragOffset > DRAG_AMT) {
                    _view.setValue(_view.value - _view.increment);
                    _dragOffset += DRAG_AMT;
                    return true;
                } else if (_dragOffset - y > DRAG_AMT) {
                    _view.setValue(_view.value + _view.increment);
                    _dragOffset -= DRAG_AMT;
                    return true;
                }
        }
        return false;
    }
}
