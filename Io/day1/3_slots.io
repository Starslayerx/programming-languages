# 如何知道某个原型都支持哪些槽

// slotNames 输出对象本身的槽，不包含原型的槽
Object slotNames println
Car := Object clone
"" println
Car slotNames println
