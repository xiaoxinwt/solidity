contract c {
    function bignum() public {
        uint e;
        e = 1e9999;
    }
}
// ----
// TypeError: Invalid literal value.
