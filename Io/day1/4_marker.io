# =（等号）、:=（冒号等号）、::=（冒号冒号等号）之间有何区别？你会在什么情况下使用它们

Car := Object clone

// := 定义更新槽
Car description := "Something to take you far away"

// = 更新槽，未定义会报错
Car description := "update"

// ::= 创建或更新 slot，并生成 setter
Car price ::= 10
Car price println
Car setPrice(20)
Car price println
Car slotNames println
