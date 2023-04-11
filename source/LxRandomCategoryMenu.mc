import Toybox.WatchUi;

class LxRandomCategoryMenuDelegate extends Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) {
        switch (item.getId()) {
            case :coinFlip:
                var view = new LxRandomDisplayView(WatchUi.loadResource($.Rez.Strings.CategoryCoinFlip));
                WatchUi.pushView(view, new LxRandomDisplayViewDelegate(view, new LxRandomGeneratorCoinFlip()), SLIDE_LEFT);
                break;
            case :dice:
                WatchUi.pushView(lxCreateDiceMenu(), new LxRandomDiceMenuDelegate(), SLIDE_LEFT);
                break;
        }
    }
}

function lxCreateCategoryMenu() {
    var menu = new Menu2({ :title => WatchUi.loadResource($.Rez.Strings.AppName) });
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.CategoryCoinFlip), null, :coinFlip, null));
    menu.addItem(new MenuItem(WatchUi.loadResource($.Rez.Strings.CategoryDice), null, :dice, null));
    return menu;
}
