import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class LxRandomSettingsMenuResetAllDelegate extends ConfirmationDelegate {
    function initialize() {
        ConfirmationDelegate.initialize();
    }

    function onResponse(response) {
        if (response == WatchUi.CONFIRM_YES) {
            Storage.clearValues();
            lxInitializeSettings();
            if (WatchUi has :showToast) {
                WatchUi.showToast(WatchUi.loadResource($.Rez.Strings.SettingsResetAllApplied), null);
            }
        }
        return true;
    }
}

class LxRandomSettingsMenuDelegate extends Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) {
        switch (item.getId()) {
            case :range:
                WatchUi.pushView(lxCreateRangeSettingsMenu(), new LxRandomSettingsRangeMenuDelegate(), SLIDE_LEFT);
                break;
            case :string:
                WatchUi.pushView(lxCreateStringSettingsMenu(), new LxRandomSettingsStringMenuDelegate(), SLIDE_LEFT);
                break;
            case :resetAll: {
                WatchUi.pushView(
                    new WatchUi.Confirmation(WatchUi.loadResource($.Rez.Strings.SettingsResetAllConfirm)),
                    new LxRandomSettingsMenuResetAllDelegate(),
                    SLIDE_LEFT
                );
            }
        }
    }
}

function lxCreateSettingsMenu() as Menu2 {
    var menu = new Menu2({ :title => WatchUi.loadResource($.Rez.Strings.CategorySettings) });
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.SettingsRangeSettings), null, :range, null));
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.SettingsStringSettings), null, :string, null));
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.SettingsResetAll), null, :resetAll, null));
    menu.addItem(
        new MenuItem(
            WatchUi.loadResource($.Rez.Strings.AppName),
            WatchUi.loadResource($.Rez.Strings.AppVersion),
            0,
            null
        )
    );
    return menu;
}
