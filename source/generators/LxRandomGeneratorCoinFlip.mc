import Toybox.Lang;

class LxRandomGeneratorCoinFlip extends LxRandomGeneratorAbstract {
    function initialize() {
        LxRandomGeneratorAbstract.initialize();
    }

    function getValue() as String {
        return getRandomFloat() < 0.5 ? "Heads" : "Tails";
    }
}
