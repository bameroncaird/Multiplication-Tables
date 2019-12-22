import UIKit

// This is a comment
/* this is a
 multiline comment */

//non-constant variables, print
var str = "Hello, playground"
print(str)
str = "hello, world"
print(str)

//constant variables
let con = "more data"
//con = "modified data" (fails, can't change constant)
print(con)

/* data types:
 String, Bool, Int, Float*/

//Bool
var b = true
print(b)
b = false
print(b)

//Int
var x = 3
print(x)
x = -1
print(x)

//Float (Double is more precise)
var f = 3.14195
print(f)
f = -0.557
print(f)

//Casting between data types
var a = 3
var c = 3.4
//a = c (fails, can't go between types once variables are declared)
a = Int(c)
print(a)

//Explicit type declaration (not necessary, usually)
var i: Int = 32
print(i)
//var y: Int = 32.4 (fails, can't declare int and then make it a float)
