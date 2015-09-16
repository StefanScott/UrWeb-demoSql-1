This is a very minor modification of the simple UrWeb Sql demo here:

http://www.impredicative.com/ur/demo/

Question:

In the original demo, and in this modified demo, the function `delete` takes two arguments: an `int` and `()`.

https://github.com/StefanScott/UrWeb-demoSql-1/blob/master/demoSql.ur#L45

The second argument `()` does not seem to be necessary. But if I remove it, the program no longer compiles, giving the compile error:
```
Have con:  int -> transaction (xml ([Html = ()]) ([]) ([]))
Need con:  int -> {} -> transaction (xml ([Html = ()]) ([]) ([]))
```
Why does the program fail to compile without this second argument `()` to the function `delete`?

Thanks for any help!
