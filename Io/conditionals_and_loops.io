// while(条件, 循环体)
i := 1
while(i <= 11, i println; i = i + 1);


// for(变量, 起点, 终点, 循环体)
// for(变量, 起点, 终点, 步长, 循环体) 这里步长计算优先于赋值
for(i, 1, 2, i println)
for(i, 1, 2, i, i println)


// if(条件, true code, false code)
if(true, "It's true." println, "It's false." println)
if(false) then("It's true." println) else("It's false." println)


// Io 将最后返回数字作为退出码，nil 是 0，shell 中为正确，非 0 为失败
nil
