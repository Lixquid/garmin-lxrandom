import Toybox.Lang;

class LxRandomGeneratorRange extends LxRandomGeneratorAbstract {
    (:initialized)
    private var _min as Number;
    (:initialized)
    private var _max as Number;

    function initialize(min as Number, max as Number) {
        LxRandomGeneratorAbstract.initialize();
        _min = min;
        _max = max;
    }

    function getValue() as String {
        return (_min + (_max - _min + 1) * getRandomFloat()).format("%i");
    }
}
