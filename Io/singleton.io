Highlander := Object clone

// 单例模式
Highlander clone := Highlander
"- Highlander:" println
Highlander println

one := Highlander clone
two := Highlander clone

"- one:" println
one println

"- two:" println
two println
"- one == true" println
one == true println
