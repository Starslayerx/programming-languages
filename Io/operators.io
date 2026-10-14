// OperatorTable 展示所有运算符
OperatorTable addOperator("xor", 11)

// 给 true/false 创建 xor 方法, bool 为方法参数
true xor := method(bool, if(bool, false, true))
false xor := method(bool, if(bool, true, false))

true xor(true) println
true xor(false) println
false xor(true) println
false xor(false) println
