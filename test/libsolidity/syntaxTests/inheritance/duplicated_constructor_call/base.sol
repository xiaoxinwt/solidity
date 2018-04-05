contract A { constructor(uint) public { } }
contract B is A(2) { constructor() A(3) public {  } }
// ----
// Warning: Duplicated super constructor calls are deprecated.
