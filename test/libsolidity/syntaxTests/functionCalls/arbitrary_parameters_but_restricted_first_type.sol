contract C {
    function f() pure public {
        abi.encodeWithSelector();
        abi.encodeWithSignature();
        abi.encodeWithSelector(uint(2), 2);
        abi.encodeWithSignature(uint(2), 2);
    }
}
// ----
// TypeError: Need at least 1 arguments for function call, but provided only 0.
// TypeError: Need at least 1 arguments for function call, but provided only 0.
// TypeError: Invalid type for argument in function call. Invalid implicit conversion from uint256 to bytes4 requested.
// TypeError: Invalid type for argument in function call. Invalid implicit conversion from uint256 to string memory requested.
