import Toybox.Application;
import Toybox.Math;
import Toybox.System;
import Toybox.WatchUi;

class LxRandomApp extends AppBase {
    function initialize() {
        AppBase.initialize();
        Math.srand(System.getTimer());
    }

    function getInitialView() {
        return [lxCreateCategoryMenu(), new LxRandomCategoryMenuDelegate()];
    }
}
