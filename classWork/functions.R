##Functions more complex, repeated expressions. they are "first class" objects, of the class "function"
## can be treated like any other object
## They have named arguments



## 3 parts

##1 BAsics
##Scoping Rules
##Example

f <- function(<arguments) {
        ##do something
}

## can be pased as arguments to other finctions
## can be nested, define a function within another function.
## THe return value of a function is the last expressiiion in the function bodu to be evaluated


## Functions have named arguments which potentially have default values
##*THe formal arguments are the argumantes included in the function definition
##* the "formals" function returns a list of all the formal argumants of a fnction
##formals(functionName)
##*Not every function call in R makes use of al the formal arguments
##*Function Argumanets can be mssing or might have default values

##R functions can be match ed by name or postionally. 
## all the following are identical calls to "sd"
myDataxxx <- rnorm(100)
sd(myDataxxx)
sd( x = myDataxxx)
sd( x = myDataxxx, na.rm =FALSE)  ##na.rm 
sd(na.rm = F, x = myDataxxx)
sd(na.rm =F, myDataxxx)

##argument matching can be mixed
## when an arg is matced by names, it is "taken out" of the arg list and the remaining unnamed  args are matched in the order the are listed in the function definition

## args(lm)

##function(formula,data,subset,weights,na.action,
##       method ="qr", model = T, x = F
##       y= F, qr =T, singular.ok =T,
##       )

## lm(data = myDataxxx, y -x, model =F, 1:6)

##functions can be partially matched, (i.e. long name only neter partial value)
## the order of operations is: 
##1. Ck for exact match for a named arg, 
##2. Ck for partial match
##3. ck for positional match


## Difing a function
f <- function(a,b =1, c =2, d = NULL){ ##NULL nothing there
        
}

## you do not have to specify a default, and you can aldso set to NULL

## Lazy Evaluation, i.e. args to fucntipns are evaluated lzily, so they are evaluated only as needed

f <- function(a,b) {
        a^2
}
f(4)
## The function never USES b, so calling f(4) does not error for passing a single value because 4 gets postionaly matched to a
##qnaother example, showing error when b is missing

f <- function(a,b) {
        print(a)
        print(b)
}  
f(45)
## 45 GOT PRINTED as "a" prior tp the error trigger.  This is becuse "b" did nt have to be evaluated until after print(a).
## Once the function tried to evaluate print(b) it had to throw the error

f(45,2*1.618)
## everything prior to error in lazy eval will execute

## special function of "..."
## ...  arg indicates a variable number if args that are usually passed on to other functions
## and is often used when extending another fucnt ion and you dont want to copy the entire arg list of the original function

myPlot <- function(x,y,type = "l",...) {
        plot(x,y, type = type,...)
}

## generic functions so that args can be passed on to a mthod
##exmple

# mean
##function(x, ...)
##UseMethod("mean")

## ... is improtant when the number of arguments pased to the function cannot be knownin advance

args(paste) ## paste function perfect example
function(...,sep = " ", collapse =NULL)
        
        args(cat) ##cat prints oncantonated string
function(..., file = "", sep = " ", fill = F,
         labels = NULL, append =F)
        
        ## IMPORTANT: any args after the ..., MUST BE NAMED explicitly and cant be partially matched
        args(paste)
function(..., sep = " ", collapse =NULL)
        
        paste("a", "b", sep = ":")
paste("a","b", se = ":") ## no partial match of se as sep








