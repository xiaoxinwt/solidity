contract C { constructor(uint) public {} }
contract A is C { constructor() C(2) public {} }
contract B is C { constructor() C(2) public {} }
contract D is A, B { }
// ----
// Warning: Duplicated super constructor calls are deprecated.
