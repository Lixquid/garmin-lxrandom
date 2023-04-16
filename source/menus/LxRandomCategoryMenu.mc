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
            case :string: {
                if (
                    !Storage.getValue(LX_S_STRCUPP) &&
                    !Storage.getValue(LX_S_STRCLOW) &&
                    !Storage.getValue(LX_S_STRCNUM) &&
                    !Storage.getValue(LX_S_STRCSYM)
                ) {
                    WatchUi.pushView(new LxRandomErrorView(WatchUi.loadResource($.Rez.Strings.ErrorNoStringCategory)), null, SLIDE_LEFT);
                    break;
                }
                var view = new LxRandomDisplayView(WatchUi.loadResource($.Rez.Strings.CategoryString), "");
                WatchUi.pushView(
                    view,
                    new LxRandomDisplayViewDelegate(
                        view,
                        new LxRandomGeneratorString(
                            Storage.getValue(LX_S_STRLEN),
                            (
                                (Storage.getValue(LX_S_STRCUPP) ? LX_STRINGCATEGORY_UPPER : 0) |
                                    (Storage.getValue(LX_S_STRCLOW) ? LX_STRINGCATEGORY_LOWER : 0) |
                                    (Storage.getValue(LX_S_STRCNUM) ? LX_STRINGCATEGORY_NUMBERS : 0) |
                                    (Storage.getValue(LX_S_STRCSYM) ? LX_STRINGCATEGORY_SYMBOLS : 0)
                            ) as LX_STRINGCATEGORY
                        )
                    ),
                    SLIDE_LEFT
                );
                break;
            }
            case :uuid: {
                var view = new LxRandomDisplayView(WatchUi.loadResource($.Rez.Strings.CategoryUUID), "");
                WatchUi.pushView(view, new LxRandomDisplayViewDelegate(view, new LxRandomGeneratorUUID()), SLIDE_LEFT);
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
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.CategoryString), null, :string, null));
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.CategoryUUID), null, :uuid, null));
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.CategorySettings), null, :settings, null));
    return menu;
}
