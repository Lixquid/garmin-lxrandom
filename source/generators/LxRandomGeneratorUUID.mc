class LxRandomGeneratorUUID extends LxRandomGeneratorAbstract {
    function initialize() {
        LxRandomGeneratorAbstract.initialize();
    }

    function getValue() {
        return Lang.format("$1$$2$-$3$-4$4$-$5$$6$-$7$$8$$9$", [
            getRandomNumber(0x10000).format("%04x"),
            getRandomNumber(0x10000).format("%04x"),

            getRandomNumber(0x10000).format("%04x"),

            // 4
            getRandomNumber(0x1000).format("%03x"),

            (8 + getRandomNumber(4)).format("%x"),
            getRandomNumber(0x1000).format("%03x"),

            getRandomNumber(0x10000).format("%04x"),
            getRandomNumber(0x10000).format("%04x"),
            getRandomNumber(0x10000).format("%04x"),
        ]);
        //0f7f7397-e902-42b8-9085-d714f88eddd3
    }
}
