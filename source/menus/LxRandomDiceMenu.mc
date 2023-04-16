import Toybox.Lang;
import Toybox.WatchUi;

class LxRandomDiceMenuDelegate extends Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) {
        var view = new LxRandomDisplayView("d" + item.getId().toString(), "");
        WatchUi.pushView(
            view,
            new LxRandomDisplayViewDelegate(view, new LxRandomGeneratorDice(item.getId() as Number)),
            SLIDE_LEFT
        );
    }
}

function lxCreateDiceMenu() as Menu2 {
    var menu = new Menu2({ :title => WatchUi.loadResource($.Rez.Strings.CategoryDice) });
    var dice = [4, 6, 8, 10, 12, 20, 100];
    for (var i = 0; i < dice.size(); i++) {
        menu.addItem(new MenuItem("d" + dice[i].toString(), null, dice[i], null));
    }
    return menu;
}
