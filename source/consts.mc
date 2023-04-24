import Toybox.Application;
import Toybox.Lang;

const LX_S_VIEWSTATE_PREFIX = "viewState.";
const LX_S_RANGEMIN = "range.min";
const LX_S_RANGEMAX = "range.max";
const LX_S_STRLEN = "string.length";
const LX_S_STRCNUM = "string.cat.numbers";
const LX_S_STRCUPP = "string.cat.upper";
const LX_S_STRCLOW = "string.cat.lower";
const LX_S_STRCSYM = "string.cat.symbols";
const LX_S_GENPASTRES = "general.showpastresults";

function lxDefaultSetting(setting as String, defaultValue) {
    if (Storage.getValue(setting) == null) {
        Storage.setValue(setting, defaultValue);
    }
}

function lxInitializeSettings() {
    lxDefaultSetting(LX_S_RANGEMIN, 1);
    lxDefaultSetting(LX_S_RANGEMAX, 10);
    lxDefaultSetting(LX_S_STRLEN, 5);
    lxDefaultSetting(LX_S_STRCNUM, true);
    lxDefaultSetting(LX_S_STRCUPP, true);
    lxDefaultSetting(LX_S_STRCLOW, false);
    lxDefaultSetting(LX_S_STRCSYM, false);
    lxDefaultSetting(LX_S_GENPASTRES, true);
}
