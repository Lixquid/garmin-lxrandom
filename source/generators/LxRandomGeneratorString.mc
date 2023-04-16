import Toybox.Lang;

enum LX_STRINGCATEGORY {
    LX_STRINGCATEGORY_UPPER = 1,
    LX_STRINGCATEGORY_LOWER = 2,
    LX_STRINGCATEGORY_NUMBERS = 4,
    LX_STRINGCATEGORY_SYMBOLS = 8,
}

class LxRandomGeneratorString extends LxRandomGeneratorAbstract {
    private var _length as Number = 0;
    (:initialized)
    private var _categories as LX_STRINGCATEGORY;

    private var _max as Number = 0;

    function initialize(length as Number, categories as LX_STRINGCATEGORY) {
        LxRandomGeneratorAbstract.initialize();
        _length = length;
        _categories = categories;
        if (_categories & LX_STRINGCATEGORY_UPPER) {
            _max += 26;
        }
        if (_categories & LX_STRINGCATEGORY_LOWER) {
            _max += 26;
        }
        if (_categories & LX_STRINGCATEGORY_NUMBERS) {
            _max += 10;
        }
        if (_categories & LX_STRINGCATEGORY_SYMBOLS) {
            _max += 32;
        }
    }

    function getValue() as String {
        var out = [] as Array<Number>;
        for (var i = 0; i < _length; i++) {
            var n = getRandomNumber(_max);
            if (_categories & LX_STRINGCATEGORY_UPPER) {
                if (n < 26) {
                    out.add(0x41 + n);
                    continue;
                }
                n -= 26;
            }
            if (_categories & LX_STRINGCATEGORY_LOWER) {
                if (n < 26) {
                    out.add(0x61 + n);
                    continue;
                }
                n -= 26;
            }
            if (_categories & LX_STRINGCATEGORY_NUMBERS) {
                if (n < 10) {
                    out.add(0x30 + n);
                    continue;
                }
                n -= 10;
            }
            if (n < 15) {
                out.add(0x21 + n);
            } else if (n < 22) {
                out.add(0x3a - 15 + n);
            } else if (n < 28) {
                out.add(0x5b - 22 + n);
            } else {
                out.add(0x7b - 28 + n);
            }
        }
        return StringUtil.utf8ArrayToString(out);
    }
}
