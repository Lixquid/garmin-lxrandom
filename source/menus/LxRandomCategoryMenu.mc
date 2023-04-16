import Toybox.Application;
import Toybox.WatchUi;

class LxRandomCategoryMenuDelegate extends Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) {
        switch (item.getId()) {
            case :coinFlip: {
                var view = new LxRandomDisplayView(WatchUi.loadResource($.Rez.Strings.CategoryCoinFlip), "");
                WatchUi.pushView(
                    view,
                    new LxRandomDisplayViewDelegate(view, new LxRandomGeneratorCoinFlip()),
                    SLIDE_LEFT
                );
                break;
            }
            case :dice:
                WatchUi.pushView(lxCreateDiceMenu(), new LxRandomDiceMenuDelegate(), SLIDE_LEFT);
                break;
            case :range: {
                var min = Storage.getValue(LX_S_RANGEMIN);
                if (min == null) {
                    min = 0;
                }
                var max = Storage.getValue(LX_S_RANGEMAX);
                if (max == null) {
                    max = 10;
                }
                var view = new LxRandomDisplayView(
                    WatchUi.loadResource($.Rez.Strings.CategoryRange),
                    min.toString() + " - " + max.toString()
                );
                WatchUi.pushView(
                    view,
                    new LxRandomDisplayViewDelegate(view, new LxRandomGeneratorRange(min, max)),
                    SLIDE_LEFT
                );
                break;
            }
            case :settings: {
                WatchUi.pushView(lxCreateSettingsMenu(), new LxRandomSettingsMenuDelegate(), SLIDE_LEFT);
                break;
            }
        }
    }
}

function lxCreateCategoryMenu() as Menu2 {
    var menu = new Menu2({ :title => WatchUi.loadResource($.Rez.Strings.AppName) });
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.CategoryCoinFlip), null, :coinFlip, null));
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.CategoryDice), null, :dice, null));
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.CategoryRange), null, :range, null));
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.CategorySettings), null, :settings, null));
    return menu;
}
