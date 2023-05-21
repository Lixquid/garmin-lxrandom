import Toybox.Application;
import Toybox.Math;
import Toybox.System;
import Toybox.WatchUi;

class LxRandomApp extends AppBase {
    function initialize() {
        AppBase.initialize();
        seedAndExerciseRandomGenerator();
        lxInitializeSettings();
    }

    function getInitialView() {
        return [lxCreateCategoryMenu(), new LxRandomCategoryMenuDelegate()];
    }

    function seedAndExerciseRandomGenerator() {
        Math.srand(System.getTimer());
        // If the activity is launched in quick succession, the seed will not
        // be very different. The Garmin Random Number generator seems to have
        // an issue where small seed differences result in similar sequences.
        // This is a workaround to exercise the generator to magnify the seed
        // difference.
        for (var i = 0; i < 100; ++i) {
            Math.rand();
        }
    }
}
