pragma experimental ABIEncoderV2;

contract C {
    struct S { uint x; }
    S s;
    struct T { uint y; }
    T t;
    function f() public view {
        bytes32 a = sha256(s, t);
        a;
    }
}
// ----
// Warning: Experimental features are turned on. Do not use experimental features on live deployments.
