contract C { constructor(uint a) public {} }
contract B is C {
    constructor() C(2) C(2) public {}
}
// ----
// DeclarationError: Base constructor already provided.
