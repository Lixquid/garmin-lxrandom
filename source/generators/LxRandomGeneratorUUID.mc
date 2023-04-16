class LxRandomGeneratorUUID extends LxRandomGeneratorAbstract {
    function initialize() {
        LxRandomGeneratorAbstract.initialize();
    }

    function getValue() {
        return Lang.format("$1$$2$-$3$-4$4$-$5$$6$-$7$$8$", [
            getRandomNumber(0x10000).format("%x"),
            getRandomNumber(0x10000).format("%x"),
            getRandomNumber(0x10000).format("%x"),
            (8 + getRandomNumber(4)).format("%x"),
            getRandomNumber(0x10000).format("%x"),
            getRandomNumber(0x10000).format("%x"),
            getRandomNumber(0x10000).format("%x"),
            getRandomNumber(0x10000).format("%x"),
        ]);
    }
}
