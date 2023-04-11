import Toybox.Lang;

class LxRandomGeneratorDice extends LxRandomGeneratorAbstract {
    (:initialized)
    private var _max as Number;

    function initialize(max as Number) {
        LxRandomGeneratorAbstract.initialize();
        _max = max;
    }

    function getValue() as String {
        return Math.floor(1 + getRandomFloat() * _max).format("%i");
    }
}
