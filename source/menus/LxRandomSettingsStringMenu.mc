import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class LxRandomSettingsStringMenuDelegate extends Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) {
        switch (item.getId()) {
            case :length: {
                var view = new LxRandomNumberPickerView({
                    :title => $.Rez.Strings.SettingsStringLength,
                    :initial => Storage.getValue(LX_S_STRLEN),
                    :callback => method(:setLength),
                    :min => 1,
                    :max => 20,
                });
                WatchUi.pushView(view, new LxRandomNumberPickerViewDelegate(view), SLIDE_LEFT);
            }
            case :upper:
                Storage.setValue(LX_S_STRCUPP, !Storage.getValue(LX_S_STRCUPP));
                break;
            case :lower:
                Storage.setValue(LX_S_STRCLOW, !Storage.getValue(LX_S_STRCLOW));
                break;
            case :numbers:
                Storage.setValue(LX_S_STRCNUM, !Storage.getValue(LX_S_STRCNUM));
                break;
            case :symbols:
                Storage.setValue(LX_S_STRCSYM, !Storage.getValue(LX_S_STRCSYM));
                break;
        }
    }

    function setLength(val as Number) as Void {
        Storage.setValue(LX_S_STRLEN, val);
        if (WatchUi has :showToast) {
            WatchUi.showToast(WatchUi.loadResource($.Rez.Strings.SettingsApplied), null);
        }
    }
}

function lxCreateStringSettingsMenu() as Menu2 {
    var menu = new Menu2({ :title => WatchUi.loadResource($.Rez.Strings.SettingsStringSettings) });
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.SettingsStringLength), null, :length, null));
    menu.addItem(
        new ToggleMenuItem(
            WatchUi.loadResource($.Rez.Strings.SettingsStringIncludeUpper),
            null,
            :upper,
            Storage.getValue(LX_S_STRCUPP),
            null
        )
    );
    menu.addItem(
        new ToggleMenuItem(
            WatchUi.loadResource($.Rez.Strings.SettingsStringIncludeLower),
            null,
            :lower,
            Storage.getValue(LX_S_STRCLOW),
            null
        )
    );
    menu.addItem(
        new ToggleMenuItem(
            WatchUi.loadResource($.Rez.Strings.SettingsStringIncludeNumbers),
            null,
            :numbers,
            Storage.getValue(LX_S_STRCNUM),
            null
        )
    );
    menu.addItem(
        new ToggleMenuItem(
            WatchUi.loadResource($.Rez.Strings.SettingsStringIncludeSymbols),
            null,
            :symbols,
            Storage.getValue(LX_S_STRCSYM),
            null
        )
    );
    return menu;
}
