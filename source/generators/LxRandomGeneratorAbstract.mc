import Toybox.Lang;

class LxRandomGeneratorAbstract {
    function getValue() as String {
        return "INVALID";
    }

    protected function getRandomFloat() as Double {
        return Math.rand() / 2147483647d; // 0x7FFF_FFFF
    }
}
