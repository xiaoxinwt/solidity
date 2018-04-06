### 0.4.22 \(unreleased\)

Features:

* Code Generator: Initialize arrays without using `msize()`.
* Code Generator: More specialized and thus optimized implementation for `x.push(...)`
* Commandline interface: Error when missing or inaccessible file detected. Suppress it with the `--ignore-missing` flag.
* General: Support accessing dynamic return data in post-byzantium EVMs.
* Interfaces: Allow overriding external functions in interfaces with public in an implementing contract.
* Optimizer: Remove useless `SWAP1` instruction preceding a commutative instruction \(such as `ADD`, `MUL`, etc\).
* Optimizer: Replace comparison operators \(`LT`, `GT`, etc\) with opposites if preceded by `SWAP1`, e.g. `SWAP1 LT` is replaced with `GT`.
* Optimizer: Optimize across `mload` if `msize()` is not used.
* Syntax Checker: Issue warning for empty structs \(or error as experimental 0.5.0 feature\).
* General: Introduce new constructor syntax using the `constructor` keyword as experimental 0.5.0 feature.
* Inheritance: Error when using empty parenthesis for base class constructors that require arguments as experimental 0.5.0 feature.

Bugfixes:

* Code Generator: Allow `block.blockhash` without being called.
* Code Generator: Do not include internal functions in the runtime bytecode which are only referenced in the constructor.
* Code Generator: Properly skip unneeded storage array cleanup when not reducing length.
* Code Generator: Bugfix in modifier lookup in libraries.
* Code Generator: Implement packed encoding of external function types.
* Code Generator: Treat empty base constructor argument list as not provided.
* Commandline interface: Support `--evm-version constantinople` properly.
* DocString Parser: Fix error message for empty descriptions.
* Standard JSON: Support `constantinople` as `evmVersion` properly.
* Type Checker: Fix detection of recursive structs.
* Type System: Improve error message when attempting to shift by a fractional amount.
* Type System: Make external library functions accessible.
* Type System: Prevent encoding of weird types.

### 0.4.21 \(2018-03-07\)

Features:

* Code Generator: Assert that `k != 0` for `mulmod(a, b, k)` and `addmod(a, b, k)` as experimental 0.5.0 feature.
* Code Generator: Do not retain any gas in calls \(except if EVM version is set to homestead\).
* Code Generator: Use `STATICCALL` opcode for calling `view` and `pure` functions as experimenal 0.5.0 feature.
* General: C99/C++-style scoping rules \(instead of JavaScript function scoping\) take effect as experimental v0.5.0 feature.
* General: Improved messaging when error spans multiple lines of a sourcefile
* General: Support and recommend using `emit EventName();` to call events explicitly.
* Inline Assembly: Enforce strict mode as experimental 0.5.0 feature.
* Interface: Provide ability to select target EVM version \(homestead or byzantium, with byzantium being the default\).
* Standard JSON: Reject badly formatted invalid JSON inputs.
* Type Checker: Disallow uninitialized storage pointers as experimental 0.5.0 feature.
* Syntax Analyser: Do not warn about experimental features if they do not concern code generation.
* Syntax Analyser: Do not warn about `pragma experimental "v0.5.0"` and do not set the experimental flag in the bytecode for this.
* Syntax Checker: Mark `throw` as an error as experimental 0.5.0 feature.
* Syntax Checker: Issue error if no visibility is specified on contract functions as experimental 0.5.0 feature.
* Syntax Checker: Issue warning when using overloads of `address` on contract instances.
* Type Checker: disallow combining hex numbers and unit denominations as experimental 0.5.0 feature.

Bugfixes:

* Assembly: Raise error on oversized number literals in assembly.
* JSON-AST: Add "documentation" property to function, event and modifier definition.
* Resolver: Properly determine shadowing for imports with aliases.
* Standalone Assembly: Do not ignore input after closing brace of top level block.
* Standard JSON: Catch errors properly when invalid "sources" are passed.
* Standard JSON: Ensure that library addresses supplied are of correct length and hex prefixed.
* Type Checker: Properly detect which array and struct types are unsupported by the old ABI encoder.
* Type Checker: Properly warn when using `_offset` and `_slot` for constants in inline assembly.
* Commandline interface: throw error if option is unknown

### 0.1.0 \(2015-07-10\)



