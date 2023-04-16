import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class LxRandomSettingsRangeMenuDelegate extends Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) {
        switch (item.getId()) {
            case :min: {
                var view = new LxRandomNumberPickerView({
                    :title => $.Rez.Strings.SettingsRangeMin,
                    :initial => Storage.getValue(LX_S_RANGEMIN),
                    :callback => method(:setMin),
                    :incrementMenu => true,
                });
                WatchUi.pushView(view, new LxRandomNumberPickerViewDelegate(view), SLIDE_LEFT);
                break;
            }
            case :max: {
                var view = new LxRandomNumberPickerView({
                    :title => $.Rez.Strings.SettingsRangeMax,
                    :initial => Storage.getValue(LX_S_RANGEMAX),
                    :callback => method(:setMax),
                    :incrementMenu => true,
                });
                WatchUi.pushView(view, new LxRandomNumberPickerViewDelegate(view), SLIDE_LEFT);
                break;
            }
        }
    }

    function setMin(val as Number) as Void {
        Storage.setValue(LX_S_RANGEMIN, val);
        if (WatchUi has :showToast) {
            WatchUi.showToast(WatchUi.loadResource($.Rez.Strings.SettingsApplied), null);
        }
    }
    function setMax(val as Number) as Void {
        Storage.setValue(LX_S_RANGEMAX, val);
        if (WatchUi has :showToast) {
            WatchUi.showToast(WatchUi.loadResource($.Rez.Strings.SettingsApplied), null);
        }
    }
}

function lxCreateRangeSettingsMenu() as Menu2 {
    var menu = new Menu2({ :title => WatchUi.loadResource($.Rez.Strings.SettingsRangeSettings) });
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.SettingsRangeMin), null, :min, null));
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.SettingsRangeMax), null, :max, null));
    return menu;
}
