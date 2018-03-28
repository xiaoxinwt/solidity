contract c {
    function f() public pure returns (int) {
        return 4 ** 4 ** 2 ** 4 ** 4 ** 4 ** 4 ** 4 ** 4 ** 4 ** 4 ** 4 ** 4 * 2;
    }
}
// ----
// TypeError: Operator ** not compatible with types int_const 1797...(301 digits omitted)...7216 and int_const 4
// TypeError: Operator ** not compatible with types int_const 1797...(301 digits omitted)...7216 and int_const 4
// TypeError: Operator ** not compatible with types int_const 1797...(301 digits omitted)...7216 and int_const 4
// TypeError: Operator ** not compatible with types int_const 1797...(301 digits omitted)...7216 and int_const 4
// TypeError: Operator ** not compatible with types int_const 1797...(301 digits omitted)...7216 and int_const 4
// TypeError: Operator ** not compatible with types int_const 1797...(301 digits omitted)...7216 and int_const 4
// TypeError: Operator ** not compatible with types int_const 1797...(301 digits omitted)...7216 and int_const 4
// TypeError: Return argument type int_const 3595...(301 digits omitted)...4432 is not implicitly convertible to expected type (type of first return variable) int256.
