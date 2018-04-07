## Solidity 源文件的布局

> 源文件中会包含一个 用于合约描述的 arbitrary 号，include 指令和 pragma 指令。

### Pragma 版本

源文件中应该包含一个 pragma 版本号，用来指定应该用哪个版本的编译器进行编译，以防止用更新的编译器编译时发生不兼容等情况。我们努力保持做最小的更改尤其是在涉及到语义上的修改时，但世事总有意外。基于此，每次在使用新的 release 版本时都应该先通过 changelog 来了解下新版本中涉及到了那些破坏性的改动。release的版本号一般以如下的形式出现：`0.x.0`或`x.0.0`。

pragma 的版本一般使用方式如下：

```
pragma solidity ^0.4.0;
```

这样标示的 Solidity 源文件若在低于0.4.0版本的编译器下就不会被编译，同样它也不会在0.5.0及以上版本的编译器中运行。

如此标示表示了在0.5.0版本之前编译器都不会有较大的破坏性的改动，如此就能保证我们的代码能以预期的方式被编译。

同样在扩展版本号没有更新之前，bug 也可能会在同级版本中存在，需要注意。

关于编译器的版本号定义有一套负责的规则，若要详细了解请参见 [npm的版本号定义](https://docs.npmjs.com/misc/semver)

### 导入其他的源文件

#### 句法和语义

Solidity支持导入片段，这点与JavaScript（从ES6开始）非常相似，虽然 Solidity并不知道合约是否“默认导出”。

在全局范围，可以使用import关键字，向如下所述：

```
import "filename";
```

这句话表示从“filename”中引入全局符号到当前的全局变量中。

```
import * as symbolName from "filename";
```

...从“filename”中引入所有的全局变量并给其起一个别名叫\`symbolName\`

```
import {symbol1 as alias, symbol2} from "filename";
```

...创建一个全局标示符`alias`和`symbol2`并分别将其关联至来自“filename”文件中的`symbol1`和`symbol2`变量上。

还有一个句法不在ES6中，但可能很方便：

```
import "filename" as symbolName;
```

等价于`import * as symbolName from "filename";`

#### 路径

上文中，`filename`表示一个路径并以`/`作为文件夹分隔符，`.`表示当前路径下，`..`表示父路径。

一般，当在`.`或`..`后面跟一个非`/`的字符时不被认为是表示当前或父文件夹。

除非以`.`或`..`开头，否则其他的形式都被认为是表示的绝对路径。

要引入同一文件夹下的文件`x`，可以使用`import "./x" as x;`,如果你使用`import "x" as x;`的话，就可能会引用到一个错误的文件（如引用到一个全局的文件x）

实际如何处理依赖于编译器，一般而言，目录等级不需要严格映射到你的本地文件系统，其也可能会映射到其他资源上，比如，ipfs,http或git等。

#### 使用真实的编译器

当编译器被引入时，it is not only possible to specify how to discover the first element of a path,but it is possible to specify path prefix remappings so than e.g.`github.com/ethereum/dapp-bin/library` is remapped to `/usr/local/dapp-bin/library` and the compiler will read the files from there. 如果多个映射被匹配上时，则拥有最长关键字的将被作为第一个。This allow for a "fallback-remapping" with e.g.`""` maps to "/usr/local/include/solidity". 而且，这些重映射依赖于上下文，即允许你通过配置文件来为不同版本的同名库设置不同的包名来便于引用。

##### solc:

对于solc\(命令行编译器\)，这里提供了几个参数如：`context:prefix=target`,同时有`context:`与`=target`两部分可选择。所有匹配上的文件都将会被编译（包括其依赖项），这种机制完全是向后兼容的（除非文件名包含or）直至下一个破坏性更新版本。All imports in files in or below the directory `context` that import a file that starts with `prefix` are redirected by replacing `prefix` by `target`。

作为示例，如果你复制`github.com/ethereum/dapp-bin/`到本地`/usr/local/dapp-in`,你可以在你的源文件中这样使用：

```
import "github.com/etherrum/dapp-bin/library/iterable_mapping.sol" as it_mapping;
```

之后运行编译器：

```
solc github.com/ethereum/dapp-bin/=/usr/local/dapp-bin/ source.sol
```

作为一个复杂的示例，此处假设你使用了dapp-bin中一个非常老的版本的模块，那个dapp-bin中的老版本被检出在`/usr/local/dapp-bin_old`目录下，接下来你可以这样使用：

```
solc module1:github.com/ethereum/dapp-bin/=/usr/local/dapp-bin/ \
     module2:github.com/ethereum/dapp-bin/=/usr/local/dapp-bin\_old/ \
     source.sol
```

这样`module2`中的所有引用就将都指向旧版本，而`module1`中的所有引用将指向新的版本。

注意，solc只允许你从确定的目录中引入文件：必须在目录中明确地指定了源文件，或者在目录中有目标映射。如果你想要允许绝对引用，只需要添加重映射`=/`

如果有多个重映射指向一个有效文件，则名字与前缀最匹配的一个将被引用。

##### Remix:

Remix 为github提供了一个自动化的重映射,并同时自动通过网络进行恢复：你可以引入一个mapping 迭代，如下：

```
import "github.com/ethereum/dapp-bin/library/iterable_mapping.sol" as it_mapping;
```

以后还会提供更多的源代码。

#### 注释

单行注释`//`和多行注释`/*...*/`。

```
// 这是单行注释。
/*
这是多行注释
*/
```

另外，还有另外一种类型的注释叫做natspec注释，他们以`///`或`/**...*/`来表示，这种用于对函数定义或程序片段进行说明。也可是使用编程辅助工具来协助完成用于格式检查的函数说明，条件注释等及提供一个$确信文本$来供用户使用，当他们调用这个函数时。

在下面的这个示例中，我们为合约书写了标题文档，并为函数书写了说明，两个参数和两个返回值

```
pragma solidity ^0.4.0;
/** @title 方形计算器 */
contract shapeCalculator {
  /** @dev 计算一个长方形的表面积和周长。
    * @param w 长方形的宽。
    * @param h 长方形的高。
    * @return s 长方形的表面积。
    * @return p 长方形的周长。
    */
    function rectangle\(uint w, uint h\) returns \(uint s, uint p\) {
        s = w \* h;
        p = 2 \* \(w + h\);
    }
}
```



