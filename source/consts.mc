import Toybox.Application;

const LX_S_VIEWSTATE_PREFIX = "viewState.";
const LX_S_RANGEMIN = "range.min";
const LX_S_RANGEMAX = "range.max";
const LX_S_STRLEN = "string.length";
const LX_S_STRCNUM = "string.cat.numbers";
const LX_S_STRCUPP = "string.cat.upper";
const LX_S_STRCLOW = "string.cat.lower";
const LX_S_STRCSYM = "string.cat.symbols";

function lxInitializeSettings() {
    if (Storage.getValue(LX_S_RANGEMIN) == null) {
        Storage.setValue(LX_S_RANGEMIN, 1);
        Storage.setValue(LX_S_RANGEMAX, 10);
        Storage.setValue(LX_S_STRLEN, 5);
        Storage.setValue(LX_S_STRCNUM, true);
        Storage.setValue(LX_S_STRCUPP, true);
        Storage.setValue(LX_S_STRCLOW, false);
        Storage.setValue(LX_S_STRCSYM, false);
    }
}
