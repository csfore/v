# V Documentation

(See https://modules.vlang.io/ for documentation of V's standard library)

## Introduction

V is a statically typed compiled programming language designed for building maintainable software.

It's similar to Go and its design has also been influenced by Oberon, Rust, Swift,
Kotlin, and Python.

V is a very simple language. Going through this documentation will take you about a weekend,
and by the end of it you will have pretty much learned the entire language.

The language promotes writing simple and clear code with minimal abstraction.

Despite being simple, V gives the developer a lot of power.
Anything you can do in other languages, you can do in V.

## Installing V from source

The best way to get the latest and greatest V, is to install it from source.
It is easy, and it takes only a few seconds:

```bash
git clone https://github.com/vlang/v
cd v
make
# HINT: Using Windows?: run make.bat in the cmd.exe shell
```

For more details, see the
[Installing V](https://github.com/vlang/v/blob/master/README.md#installing-v-from-source)
section in the README.md.

## Upgrading V to latest version

If V is already installed on a machine, it can be upgraded to its latest version
by using the V's built-in self-updater.
To do so, run the command `v up`.

## Getting started

You can let V automatically set up the bare-bones structure of a project for you
by using any of the following commands in a terminal:

* `v init` → adds necessary files to the current folder to make it a V project
* `v new abc` → creates a new project in the new folder `abc`, by default a "hello world" project.
* `v new abcd web` → creates a new project in the new folder `abcd`, using the vweb template.

## Table of Contents

<table>
<tr><td width=33% valign=top>

* [Hello world](#hello-world)
* [Running a project folder](#running-a-project-folder-with-several-files)
* [Comments](#comments)
* [Functions](#functions)
    * [Hoistings](#hoistings)
    * [Returning multiple values](#returning-multiple-values)
* [Symbol visibility](#symbol-visibility)
* [Variables](#variables)
    * [Mutable variables](#mutable-variables)
    * [Initialization vs assignment](#initialization-vs-assignment)
    * [Declaration errors](#declaration-errors)
* [V types](#v-types)
    * [Primitive types](#primitive-types)
    * [Strings](#strings)
    * [Runes](#runes)
    * [Numbers](#numbers)
    * [Arrays](#arrays)
        * [Multidimensional arrays](#multidimensional-arrays)
        * [Array methods](#array-methods)
        * [Array slices](#array-slices)
    * [Fixed size arrays](#fixed-size-arrays)
    * [Maps](#maps)

</td><td width=33% valign=top>

* [Module imports](module_imports.md)
    * [Selective imports](module_imports.md#selective-imports)
    * [Module import aliasing](module_imports.md#module-import-aliasing)
* [Statements & expressions](statements.md)
    * [If](statements.md#if)
    * [Match](statements.md#match)
    * [In operator](statements.md#in-operator)
    * [For loop](statements.md#for-loop)
    * [Defer](statements.md#defer)
    * [Goto](statements.md#goto)
* [Structs](structs.md)
    * [Heap structs](#heap-structs)
    * [Default field values](#default-field-values)
    * [Required fields](#required-fields)
    * [Short struct literal syntax](#short-struct-literal-syntax)
    * [Struct update syntax](#struct-update-syntax)
    * [Trailing struct literal arguments](#trailing-struct-literal-arguments)
    * [Access modifiers](#access-modifiers)
    * [Anonymous structs](#anonymous-structs)
    * [[noinit] structs](#noinit-structs)
    * [Methods](#methods)
    * [Embedded structs](#embedded-structs)
* [Unions](#unions)

</td><td valign=top>

* [Functions 2](#functions-2)
    * [Immutable function args by default](#immutable-function-args-by-default)
    * [Mutable arguments](#mutable-arguments)
    * [Variable number of arguments](#variable-number-of-arguments)
    * [Anonymous & higher-order functions](#anonymous--higher-order-functions)
    * [Closures](#closures)
    * [Parameter evaluation order](#parameter-evaluation-order)
* [References](#references)
* [Constants](#constants)
    * [Required module prefix](#required-module-prefix)
* [Builtin functions](#builtin-functions)
    * [println](#println)
    * [Printing custom types](#printing-custom-types)
    * [Dumping expressions at runtime](#dumping-expressions-at-runtime)
* [Modules](#modules)
    * [Create modules](#create-modules)
    * [init functions](#init-functions)

</td></tr>
<tr><td width=33% valign=top>

* [Type Declarations](#type-declarations)
    * [Type aliases](#type-aliases)
    * [Enums](#enums)
    * [Function Types](#function-types)
    * [Interfaces](#interfaces)
    * [Sum types](#sum-types)
    * [Option/Result types & error handling](#optionresult-types-and-error-handling)
        * [Handling options/results](#handling-optionsresults)
    * [Custom error types](#custom-error-types)
    * [Generics](#generics)
* [Concurrency](#concurrency)
    * [Spawning Concurrent Tasks](#spawning-concurrent-tasks)
    * [Channels](#channels)
    * [Shared Objects](#shared-objects)
* [JSON](#json)
    * [Decoding JSON](#decoding-json)
    * [Encoding JSON](#encoding-json)
* [Testing](#testing)
    * [Asserts](#asserts)
    * [Asserts with an extra message](#asserts-with-an-extra-message)
    * [Asserts that do not abort your program](#asserts-that-do-not-abort-your-program)
    * [Test files](#test-files)
    * [Running tests](#running-tests)
* [Memory management](#memory-management)
    * [Control](#control)
    * [Stack and Heap](#stack-and-heap)
* [ORM](#orm)
* [Writing documentation](#writing-documentation)
    * [Newlines in Documentation Comments](#newlines-in-documentation-comments)

</td><td width=33% valign=top>

* [Tools](#tools)
    * [v fmt](#v-fmt)
    * [v shader](#v-shader)
    * [Profiling](#profiling)
* [Package Management](#package-management)
    * [Package commands](#package-commands)
    * [Publish package](#publish-package)
* [Advanced Topics](#advanced-topics)
    * [Attributes](#attributes)
    * [Conditional compilation](#conditional-compilation)
        * [Compile time pseudo variables](#compile-time-pseudo-variables)
        * [Compile-time reflection](#compile-time-reflection)
        * [Compile time code](#compile-time-code)
        * [Environment specific files](#environment-specific-files)
    * [Memory-unsafe code](#memory-unsafe-code)
    * [Structs with reference fields](#structs-with-reference-fields)
    * [sizeof and __offsetof](#sizeof-and-__offsetof)
    * [Limited operator overloading](#limited-operator-overloading)
    * [Performance tuning](#performance-tuning)
    * [Atomics](#atomics)
    * [Global Variables](#global-variables)
    * [Cross compilation](#cross-compilation)
    * [Debugging](#debugging)
        * [C Backend binaries Default](#c-backend-binaries-default)
        * [Native Backend binaries](#native-backend-binaries)
        * [Javascript Backend](#javascript-backend)

</td><td valign=top>

* [V and C](#v-and-c)
    * [Calling C from V](#calling-c-from-v)
    * [Calling V from C](#calling-v-from-c)
    * [Passing C compilation flags](#passing-c-compilation-flags)
    * [#pkgconfig](#pkgconfig)
    * [Including C code](#including-c-code)
    * [C types](#c-types)
    * [C Declarations](#c-declarations)
    * [Export to shared library](#export-to-shared-library)
    * [Translating C to V](#translating-c-to-v)
    * [Working around C issues](#working-around-c-issues)
* [Other V Features](#other-v-features)
    * [Inline assembly](#inline-assembly)
    * [Hot code reloading](#hot-code-reloading)
    * [Cross-platform shell scripts in V](#cross-platform-shell-scripts-in-v)
    * [Vsh scripts with no extension](#vsh-scripts-with-no-extension)
* [Appendices](#appendices)
    * [Keywords](#appendix-i-keywords)
    * [Operators](#appendix-ii-operators)

</td></tr>
</table>

<!--
Note: There are several special keywords, which you can put after the code fences for v:
compile, cgen, live, ignore, failcompile, okfmt, oksyntax, badsyntax, wip, nofmt
For more details, do: `v check-md`
-->

## Hello World

```v
fn main() {
	println('hello world')
}
```

Save this snippet into a file named `hello.v`. Now do: `v run hello.v`.

> That is assuming you have symlinked your V with `v symlink`, as described
[here](https://github.com/vlang/v/blob/master/README.md#symlinking).
> If you haven't yet, you have to type the path to V manually.

Congratulations - you just wrote and executed your first V program!

You can compile a program without execution with `v hello.v`.
See `v help` for all supported commands.

From the example above, you can see that functions are declared with the `fn` keyword.
The return type is specified after the function name.
In this case `main` doesn't return anything, so there is no return type.

As in many other languages (such as C, Go, and Rust), `main` is the entry point of your program.

[`println`](#println) is one of the few [built-in functions](#builtin-functions).
It prints the value passed to it to standard output.

`fn main()` declaration can be skipped in one file programs.
This is useful when writing small programs, "scripts", or just learning the language.
For brevity, `fn main()` will be skipped in this tutorial.

This means that a "hello world" program in V is as simple as

```v
println('hello world')
```

> **Note**
> If you do not explicitly use `fn main() {}`, you need to make sure that all your
> declarations come before any variable assignment statements or top level function calls,
> since V will consider everything after the first assignment/function call as part of your
> implicit main function.

## Running a project folder with several files

Suppose you have a folder with several .v files in it, where one of them
contains your `main()` function, and the other files have other helper
functions. They may be organized by topic, but still *not yet* structured
enough to be their own separate reusable modules, and you want to compile
them all into one program.

In other languages, you would have to use includes or a build system
to enumerate all files, compile them separately to object files,
then link them into one final executable.

In V however, you can compile and run the whole folder of .v files together,
using just `v run .`. Passing parameters also works, so you can
do: `v run . --yourparam some_other_stuff`

The above will first compile your files into a single program (named
after your folder/project), and then it will execute the program with
`--yourparam some_other_stuff` passed to it as CLI parameters.

Your program can then use the CLI parameters like this:

```v
import os

println(os.args)
```

> **Note**
> After a successful run, V will delete the generated executable.
> If you want to keep it, use `v -keepc run .` instead, or just compile
> manually with `v .` .

> **Note**
> Any V compiler flags should be passed *before* the `run` command.
> Everything after the source file/folder, will be passed to the program
> as is - it will not be processed by V.

## Comments

```v
// This is a single line comment.
/*
This is a multiline comment.
   /* It can be nested. */
*/
```

## Functions

```v
fn main() {
	println(add(77, 33))
	println(sub(100, 50))
}

fn add(x int, y int) int {
	return x + y
}

fn sub(x int, y int) int {
	return x - y
}
```

Again, the type comes after the argument's name.

Just like in Go and C, functions cannot be overloaded.
This simplifies the code and improves maintainability and readability.

### Hoistings

Functions can be used before their declaration:
`add` and `sub` are declared after `main`, but can still be called from `main`.
This is true for all declarations in V and eliminates the need for header files
or thinking about the order of files and declarations.

### Returning multiple values

```v
fn foo() (int, int) {
	return 2, 3
}

a, b := foo()
println(a) // 2
println(b) // 3
c, _ := foo() // ignore values using `_`
```

## Symbol visibility

```v
pub fn public_function() {
}

fn private_function() {
}
```

Functions are private (not exported) by default.
To allow other [modules](#module-imports) to use them, prepend `pub`. The same applies
to [structs](#structs), [constants](#constants) and [types](#type-declarations).

> **Note**
> `pub` can only be used from a named module.
> For information about creating a module, see [Modules](#modules).

## Variables

```v
name := 'Bob'
age := 20
large_number := i64(9999999999)
println(name)
println(age)
println(large_number)
```

Variables are declared and initialized with `:=`. This is the only
way to declare variables in V. This means that variables always have an initial
value.

The variable's type is inferred from the value on the right hand side.
To choose a different type, use type conversion:
the expression `T(v)` converts the value `v` to the
type `T`.

Unlike most other languages, V only allows defining variables in functions.
By default V does not allow **global variables**. See more [details](#global-variables).

For consistency across different code bases, all variable and function names
must use the `snake_case` style, as opposed to type names, which must use `PascalCase`.

### Mutable variables

```v
mut age := 20
println(age)
age = 21
println(age)
```

To change the value of the variable use `=`. In V, variables are
immutable by default.
To be able to change the value of the variable, you have to declare it with `mut`.

Try compiling the program above after removing `mut` from the first line.

### Initialization vs assignment

Note the (important) difference between `:=` and `=`.
`:=` is used for declaring and initializing, `=` is used for assigning.

```v failcompile
fn main() {
	age = 21
}
```

This code will not compile, because the variable `age` is not declared.
All variables need to be declared in V.

```v
fn main() {
	age := 21
}
```

The values of multiple variables can be changed in one line.
In this way, their values can be swapped without an intermediary variable.

```v
mut a := 0
mut b := 1
println('${a}, ${b}') // 0, 1
a, b = b, a
println('${a}, ${b}') // 1, 0
```

### Declaration errors

In development mode the compiler will warn you that you haven't used the variable
(you'll get an "unused variable" warning).
In production mode (enabled by passing the `-prod` flag to v – `v -prod foo.v`)
it will not compile at all (like in Go).

```v failcompile nofmt
fn main() {
	a := 10
	if true {
		a := 20 // error: redefinition of `a`
	}
	// warning: unused variable `a`
}
```

Unlike most languages, variable shadowing is not allowed. Declaring a variable with a name
that is already used in a parent scope will cause a compilation error.

## V Types

### Primitive types

```v ignore
bool

string

i8    i16  int  i64      i128 (soon)
u8    u16  u32  u64      u128 (soon)

rune // represents a Unicode code point

f32 f64

isize, usize // platform-dependent, the size is how many bytes it takes to reference any location in memory

voidptr // this one is mostly used for [C interoperability](#v-and-c)

any // similar to C's void* and Go's interface{}
```

> **Note**
> Unlike C and Go, `int` is always a 32 bit integer.

There is an exception to the rule that all operators
in V must have values of the same type on both sides. A small primitive type
on one side can be automatically promoted if it fits
completely into the data range of the type on the other side.
These are the allowed possibilities:

```v ignore
   i8 → i16 → int → i64
                  ↘     ↘
                    f32 → f64
                  ↗     ↗
   u8 → u16 → u32 → u64 ⬎
      ↘     ↘     ↘      ptr
   i8 → i16 → int → i64 ⬏
```

An `int` value for example can be automatically promoted to `f64`
or `i64` but not to `u32`. (`u32` would mean loss of the sign for
negative values).
Promotion from `int` to `f32`, however, is currently done automatically
(but can lead to precision loss for large values).

Literals like `123` or `4.56` are treated in a special way. They do
not lead to type promotions, however they default to `int` and `f64`
respectively, when their type has to be decided:

```v nofmt
u := u16(12)
v := 13 + u    // v is of type `u16` - no promotion
x := f32(45.6)
y := x + 3.14  // x is of type `f32` - no promotion
a := 75        // a is of type `int` - default for int literal
b := 14.7      // b is of type `f64` - default for float literal
c := u + a     // c is of type `int` - automatic promotion of `u`'s value
d := b + x     // d is of type `f64` - automatic promotion of `x`'s value
```

### Strings

```v nofmt
name := 'Bob'
assert name.len == 3       // will print 3
assert name[0] == u8(66) // indexing gives a byte, u8(66) == `B`
assert name[1..3] == 'ob'  // slicing gives a string 'ob'

// escape codes
windows_newline := '\r\n'      // escape special characters like in C
assert windows_newline.len == 2

// arbitrary bytes can be directly specified using `\x##` notation where `#` is
// a hex digit aardvark_str := '\x61ardvark' assert aardvark_str == 'aardvark'
assert '\xc0'[0] == u8(0xc0)

// or using octal escape `\###` notation where `#` is an octal digit
aardvark_str2 := '\141ardvark'
assert aardvark_str2 == 'aardvark'

// Unicode can be specified directly as `\u####` where # is a hex digit
// and will be converted internally to its UTF-8 representation
star_str := '\u2605' // ★
assert star_str == '★'
assert star_str == '\xe2\x98\x85' // UTF-8 can be specified this way too.
```

In V, a string is a read-only array of bytes. All Unicode characters are encoded using UTF-8:

```v
s := 'hello 🌎' // emoji takes 4 bytes
assert s.len == 10

arr := s.bytes() // convert `string` to `[]u8`
assert arr.len == 10

s2 := arr.bytestr() // convert `[]byte` to `string`
assert s2 == s
```

String values are immutable. You cannot mutate elements:

```v failcompile
mut s := 'hello 🌎'
s[0] = `H` // not allowed
```

> error: cannot assign to `s[i]` since V strings are immutable

Note that indexing a string will produce a `byte`, not a `rune` nor another `string`. Indexes
correspond to _bytes_ in the string, not Unicode code points. If you want to convert the `byte` to a
`string`, use the `.ascii_str()` method on the `byte`:

```v
country := 'Netherlands'
println(country[0]) // Output: 78
println(country[0].ascii_str()) // Output: N
```

Both single and double quotes can be used to denote strings. For consistency, `vfmt` converts double
quotes to single quotes unless the string contains a single quote character.

For raw strings, prepend `r`. Escape handling is not done for raw strings:

```v
s := r'hello\nworld' // the `\n` will be preserved as two characters
println(s) // "hello\nworld"
```

Strings can be easily converted to integers:

```v
s := '42'
n := s.int() // 42

// all int literals are supported
assert '0xc3'.int() == 195
assert '0o10'.int() == 8
assert '0b1111_0000_1010'.int() == 3850
assert '-0b1111_0000_1010'.int() == -3850
```

For more advanced `string` processing and conversions, refer to the
[vlib/strconv](https://modules.vlang.io/strconv.html) module.

#### String interpolation

Basic interpolation syntax is pretty simple - use `${` before a variable name and `}` after. The
variable will be converted to a string and embedded into the literal:

```v
name := 'Bob'
println('Hello, ${name}!') // Hello, Bob!
```

It also works with fields: `'age = ${user.age}'`. You may also use more complex expressions:
`'can register = ${user.age > 13}'`.

Format specifiers similar to those in C's `printf()` are also supported. `f`, `g`, `x`, `o`, `b`,
etc. are optional and specify the output format. The compiler takes care of the storage size, so
there is no `hd` or `llu`.

To use a format specifier, follow this pattern:

`${varname:[flags][width][.precision][type]}`

- flags: may be zero or more of the following: `-` to left-align output within the field, `0` to use
  `0` as the padding character instead of the default `space` character.
  > **Note**
  > V does not currently support the use of `'` or `#` as format flags, and V supports but
  > doesn't need `+` to right-align since that's the default.
- width: may be an integer value describing the minimum width of total field to output.
- precision: an integer value preceded by a `.` will guarantee that many digits after the decimal
  point, if the input variable is a float. Ignored if variable is an integer.
- type: `f` and `F` specify the input is a float and should be rendered as such, `e` and `E` specify
  the input is a float and should be rendered as an exponent (partially broken), `g` and `G` specify
  the input is a float--the renderer will use floating point notation for small values and exponent
  notation for large values, `d` specifies the input is an integer and should be rendered in base-10
  digits, `x` and `X` require an integer and will render it as hexadecimal digits, `o` requires an
  integer and will render it as octal digits, `b` requires an integer and will render it as binary
  digits, `s` requires a string (almost never used).

  > **Note**
  > When a numeric type can render alphabetic characters, such as hex strings or special values
  > like `infinity`, the lowercase version of the type forces lowercase alphabetics and the
  > uppercase version forces uppercase alphabetics.

  > **Note**
  > In most cases, it's best to leave the format type empty. Floats will be rendered by
  > default as `g`, integers will be rendered by default as `d`, and `s` is almost always redundant.
  > There are only three cases where specifying a type is recommended:

- format strings are parsed at compile time, so specifying a type can help detect errors then
- format strings default to using lowercase letters for hex digits and the `e` in exponents. Use a
  uppercase type to force the use of uppercase hex digits and an uppercase `E` in exponents.
- format strings are the most convenient way to get hex, binary or octal strings from an integer.

See
[Format Placeholder Specification](https://en.wikipedia.org/wiki/Printf_format_string#Format_placeholder_specification)
for more information.

```v
x := 123.4567
println('[${x:.2}]') // round to two decimal places => [123.46]
println('[${x:10}]') // right-align with spaces on the left => [   123.457]
println('[${int(x):-10}]') // left-align with spaces on the right => [123       ]
println('[${int(x):010}]') // pad with zeros on the left => [0000000123]
println('[${int(x):b}]') // output as binary => [1111011]
println('[${int(x):o}]') // output as octal => [173]
println('[${int(x):X}]') // output as uppercase hex => [7B]

println('[${10.0000:.2}]') // remove insignificant 0s at the end => [10]
println('[${10.0000:.2f}]') // do show the 0s at the end, even though they do not change the number => [10.00]
```

#### String operators

```v
name := 'Bob'
bobby := name + 'by' // + is used to concatenate strings
println(bobby) // "Bobby"
mut s := 'hello '
s += 'world' // `+=` is used to append to a string
println(s) // "hello world"
```

All operators in V must have values of the same type on both sides. You cannot concatenate an
integer to a string:

```v failcompile
age := 10
println('age = ' + age) // not allowed
```

> error: infix expr: cannot use `int` (right expression) as `string`

We have to either convert `age` to a `string`:

```v
age := 11
println('age = ' + age.str())
```

or use string interpolation (preferred):

```v
age := 12
println('age = ${age}')
```

See all methods of [string](https://modules.vlang.io/index.html#string)
and related modules [strings](https://modules.vlang.io/strings.html),
[strconv](https://modules.vlang.io/strconv.html).

### Runes

A `rune` represents a single Unicode character and is an alias for `u32`.
To denote them, use <code>`</code> (backticks) :

```v
rocket := `🚀`
```

A `rune` can be converted to a UTF-8 string by using the `.str()` method.

```v
rocket := `🚀`
assert rocket.str() == '🚀'
```

A `rune` can be converted to UTF-8 bytes by using the `.bytes()` method.

```v
rocket := `🚀`
assert rocket.bytes() == [u8(0xf0), 0x9f, 0x9a, 0x80]
```

Hex, Unicode, and Octal escape sequences also work in a `rune` literal:

```v
assert `\x61` == `a`
assert `\141` == `a`
assert `\u0061` == `a`

// multibyte literals work too
assert `\u2605` == `★`
assert `\u2605`.bytes() == [u8(0xe2), 0x98, 0x85]
assert `\xe2\x98\x85`.bytes() == [u8(0xe2), 0x98, 0x85]
assert `\342\230\205`.bytes() == [u8(0xe2), 0x98, 0x85]
```

Note that `rune` literals use the same escape syntax as strings, but they can only hold one unicode
character. Therefore, if your code does not specify a single Unicode character, you will receive an
error at compile time.

Also remember that strings are indexed as bytes, not runes, so beware:

```v
rocket_string := '🚀'
assert rocket_string[0] != `🚀`
assert 'aloha!'[0] == `a`
```

A string can be converted to runes by the `.runes()` method.

```v
hello := 'Hello World 👋'
hello_runes := hello.runes() // [`H`, `e`, `l`, `l`, `o`, ` `, `W`, `o`, `r`, `l`, `d`, ` `, `👋`]
assert hello_runes.string() == hello
```

### Numbers

```v
a := 123
```

This will assign the value of 123 to `a`. By default `a` will have the
type `int`.

You can also use hexadecimal, binary or octal notation for integer literals:

```v
a := 0x7B
b := 0b01111011
c := 0o173
```

All of these will be assigned the same value, 123. They will all have type
`int`, no matter what notation you used.

V also supports writing numbers with `_` as separator:

```v
num := 1_000_000 // same as 1000000
three := 0b0_11 // same as 0b11
float_num := 3_122.55 // same as 3122.55
hexa := 0xF_F // same as 255
oct := 0o17_3 // same as 0o173
```

If you want a different type of integer, you can use casting:

```v
a := i64(123)
b := u8(42)
c := i16(12345)
```

Assigning floating point numbers works the same way:

```v
f := 1.0
f1 := f64(3.14)
f2 := f32(3.14)
```

If you do not specify the type explicitly, by default float literals
will have the type of `f64`.

Float literals can also be declared as a power of ten:

```v
f0 := 42e1 // 420
f1 := 123e-2 // 1.23
f2 := 456e+2 // 45600
```

### Arrays

An array is a collection of data elements of the same type. An array literal is a
list of expressions surrounded by square brackets. An individual element can be
accessed using an *index* expression. Indexes start from `0`:

```v
mut nums := [1, 2, 3]
println(nums) // `[1, 2, 3]`
println(nums[0]) // `1`
println(nums[1]) // `2`

nums[1] = 5
println(nums) // `[1, 5, 3]`
```

<a id='array-operations'></a>

An element can be appended to the end of an array using the push operator `<<`.
It can also append an entire array.

```v
mut nums := [1, 2, 3]
nums << 4
println(nums) // "[1, 2, 3, 4]"

// append array
nums << [5, 6, 7]
println(nums) // "[1, 2, 3, 4, 5, 6, 7]"
```

```v
mut names := ['John']
names << 'Peter'
names << 'Sam'
// names << 10  <-- This will not compile. `names` is an array of strings.
```

`val in array` returns true if the array contains `val`. See [`in` operator](#in-operator).

```v
names := ['John', 'Peter', 'Sam']
println('Alex' in names) // "false"
```

#### Array Fields

There are two fields that control the "size" of an array:

* `len`: *length* - the number of pre-allocated and initialized elements in the array
* `cap`: *capacity* - the amount of memory space which has been reserved for elements,
  but not initialized or counted as elements. The array can grow up to this size without
  being reallocated. Usually, V takes care of this field automatically but there are
  cases where the user may want to do manual optimizations (see [below](#array-initialization)).

```v
mut nums := [1, 2, 3]
println(nums.len) // "3"
println(nums.cap) // "3" or greater
nums = [] // The array is now empty
println(nums.len) // "0"
```

`data` is a field (of type `voidptr`) with the address of the first
element. This is for low-level [`unsafe`](#memory-unsafe-code) code.

> **Note**
> Fields are read-only and can't be modified by the user.

#### Array Initialization

The type of an array is determined by the first element:

* `[1, 2, 3]` is an array of ints (`[]int`).
* `['a', 'b']` is an array of strings (`[]string`).

The user can explicitly specify the type for the first element: `[u8(16), 32, 64, 128]`.
V arrays are homogeneous (all elements must have the same type).
This means that code like `[1, 'a']` will not compile.

The above syntax is fine for a small number of known elements but for very large or empty
arrays there is a second initialization syntax:

```v
mut a := []int{len: 10000, cap: 30000, init: 3}
```

This creates an array of 10000 `int` elements that are all initialized with `3`. Memory
space is reserved for 30000 elements. The parameters `len`, `cap` and `init` are optional;
`len` defaults to `0` and `init` to the default initialization of the element type (`0`
for numerical type, `''` for `string`, etc). The run time system makes sure that the
capacity is not smaller than `len` (even if a smaller value is specified explicitly):

```v
arr := []int{len: 5, init: -1}
// `arr == [-1, -1, -1, -1, -1]`, arr.cap == 5

// Declare an empty array:
users := []int{}
```

Setting the capacity improves performance of pushing elements to the array
as reallocations can be avoided:

```v
mut numbers := []int{cap: 1000}
println(numbers.len) // 0
// Now appending elements won't reallocate
for i in 0 .. 1000 {
	numbers << i
}
```

> **Note**
> The above code uses a [range `for`](#range-for) statement.

You can initialize the array by accessing the `index` variable which gives
the index as shown here:

```v
count := []int{len: 4, init: index}
assert count == [0, 1, 2, 3]

mut square := []int{len: 6, init: index * index}
// square == [0, 1, 4, 9, 16, 25]
```

#### Array Types

An array can be of these types:

| Types        | Example Definition                   |
|--------------|--------------------------------------|
| Number       | `[]int,[]i64`                        |
| String       | `[]string`                           |
| Rune         | `[]rune`                             |
| Boolean      | `[]bool`                             |
| Array        | `[][]int`                            |
| Struct       | `[]MyStructName`                     |
| Channel      | `[]chan f64`                         |
| Function     | `[]MyFunctionType` `[]fn (int) bool` |
| Interface    | `[]MyInterfaceName`                  |
| Sum Type     | `[]MySumTypeName`                    |
| Generic Type | `[]T`                                |
| Map          | `[]map[string]f64`                   |
| Enum         | `[]MyEnumType`                       |
| Alias        | `[]MyAliasTypeName`                  |
| Thread       | `[]thread int`                       |
| Reference    | `[]&f64`                             |
| Shared       | `[]shared MyStructType`              |

**Example Code:**

This example uses [Structs](#structs) and [Sum Types](#sum-types) to create an array
which can handle different types (e.g. Points, Lines) of data elements.

```v
struct Point {
	x int
	y int
}

struct Line {
	p1 Point
	p2 Point
}

type ObjectSumType = Line | Point

mut object_list := []ObjectSumType{}
object_list << Point{1, 1}
object_list << Line{
	p1: Point{3, 3}
	p2: Point{4, 4}
}
dump(object_list)
/*
object_list: [ObjectSumType(Point{
    x: 1
    y: 1
}), ObjectSumType(Line{
    p1: Point{
        x: 3
        y: 3
    }
    p2: Point{
        x: 4
        y: 4
    }
})]
*/
```

#### Multidimensional Arrays

Arrays can have more than one dimension.

2d array example:

```v
mut a := [][]int{len: 2, init: []int{len: 3}}
a[0][1] = 2
println(a) // [[0, 2, 0], [0, 0, 0]]
```

3d array example:

```v
mut a := [][][]int{len: 2, init: [][]int{len: 3, init: []int{len: 2}}}
a[0][1][1] = 2
println(a) // [[[0, 0], [0, 2], [0, 0]], [[0, 0], [0, 0], [0, 0]]]
```

#### Array methods

All arrays can be easily printed with `println(arr)` and converted to a string
with `s := arr.str()`.

Copying the data from the array is done with `.clone()`:

```v
nums := [1, 2, 3]
nums_copy := nums.clone()
```

Arrays can be efficiently filtered and mapped with the `.filter()` and
`.map()` methods:

```v
nums := [1, 2, 3, 4, 5, 6]
even := nums.filter(it % 2 == 0)
println(even) // [2, 4, 6]
// filter can accept anonymous functions
even_fn := nums.filter(fn (x int) bool {
	return x % 2 == 0
})
println(even_fn)
```

```v
words := ['hello', 'world']
upper := words.map(it.to_upper())
println(upper) // ['HELLO', 'WORLD']
// map can also accept anonymous functions
upper_fn := words.map(fn (w string) string {
	return w.to_upper()
})
println(upper_fn) // ['HELLO', 'WORLD']
```

`it` is a builtin variable which refers to the element currently being
processed in filter/map methods.

Additionally, `.any()` and `.all()` can be used to conveniently test
for elements that satisfy a condition.

```v
nums := [1, 2, 3]
println(nums.any(it == 2)) // true
println(nums.all(it >= 2)) // false
```

There are further built-in methods for arrays:

* `a.repeat(n)` concatenates the array elements `n` times
* `a.insert(i, val)` inserts a new element `val` at index `i` and
  shifts all following elements to the right
* `a.insert(i, [3, 4, 5])` inserts several elements
* `a.prepend(val)` inserts a value at the beginning, equivalent to `a.insert(0, val)`
* `a.prepend(arr)` inserts elements of array `arr` at the beginning
* `a.trim(new_len)` truncates the length (if `new_length < a.len`, otherwise does nothing)
* `a.clear()` empties the array without changing `cap` (equivalent to `a.trim(0)`)
* `a.delete_many(start, size)` removes `size` consecutive elements from index `start`
  &ndash; triggers reallocation
* `a.delete(index)` equivalent to `a.delete_many(index, 1)`
* `a.delete_last()` removes the last element
* `a.first()` equivalent to `a[0]`
* `a.last()` equivalent to `a[a.len - 1]`
* `a.pop()` removes the last element and returns it
* `a.reverse()` makes a new array with the elements of `a` in reverse order
* `a.reverse_in_place()` reverses the order of elements in `a`
* `a.join(joiner)` concatenates an array of strings into one string
  using `joiner` string as a separator

See all methods of [array](https://modules.vlang.io/index.html#array)

See also [vlib/arrays](https://modules.vlang.io/arrays.html).

##### Sorting Arrays

Sorting arrays of all kinds is very simple and intuitive. Special variables `a` and `b`
are used when providing a custom sorting condition.

```v
mut numbers := [1, 3, 2]
numbers.sort() // 1, 2, 3
numbers.sort(a > b) // 3, 2, 1
```

```v
struct User {
	age  int
	name string
}

mut users := [User{21, 'Bob'}, User{20, 'Zarkon'}, User{25, 'Alice'}]
users.sort(a.age < b.age) // sort by User.age int field
users.sort(a.name > b.name) // reverse sort by User.name string field
```

V also supports custom sorting, through the `sort_with_compare` array method.
Which expects a comparing function which will define the sort order.
Useful for sorting on multiple fields at the same time by custom sorting rules.
The code below sorts the array ascending on `name` and descending `age`.

```v
struct User {
	age  int
	name string
}

mut users := [User{21, 'Bob'}, User{65, 'Bob'}, User{25, 'Alice'}]

custom_sort_fn := fn (a &User, b &User) int {
	// return -1 when a comes before b
	// return 0, when both are in same order
	// return 1 when b comes before a
	if a.name == b.name {
		if a.age < b.age {
			return 1
		}
		if a.age > b.age {
			return -1
		}
		return 0
	}
	if a.name < b.name {
		return -1
	} else if a.name > b.name {
		return 1
	}
	return 0
}
users.sort_with_compare(custom_sort_fn)
```

#### Array Slices

A slice is a part of a parent array. Initially it refers to the elements
between two indices separated by a `..` operator. The right-side index must
be greater than or equal to the left side index.

If a right-side index is absent, it is assumed to be the array length. If a
left-side index is absent, it is assumed to be 0.

```v
nums := [0, 10, 20, 30, 40]
println(nums[1..4]) // [10, 20, 30]
println(nums[..4]) // [0, 10, 20, 30]
println(nums[1..]) // [10, 20, 30, 40]
```

In V slices are arrays themselves (they are not distinct types). As a result
all array operations may be performed on them. E.g. they can be pushed onto an
array of the same type:

```v
array_1 := [3, 5, 4, 7, 6]
mut array_2 := [0, 1]
array_2 << array_1[..3]
println(array_2) // `[0, 1, 3, 5, 4]`
```

A slice is always created with the smallest possible capacity `cap == len` (see
[`cap` above](#array-initialization)) no matter what the capacity or length
of the parent array is. As a result it is immediately reallocated and copied to another
memory location when the size increases thus becoming independent from the
parent array (*copy on grow*). In particular pushing elements to a slice
does not alter the parent:

```v
mut a := [0, 1, 2, 3, 4, 5]
mut b := a[2..4]
b[0] = 7 // `b[0]` is referring to `a[2]`
println(a) // `[0, 1, 7, 3, 4, 5]`
b << 9
// `b` has been reallocated and is now independent from `a`
println(a) // `[0, 1, 7, 3, 4, 5]` - no change
println(b) // `[7, 3, 9]`
```

Appending to the parent array may or may not make it independent from its child slices.
The behaviour depends on the parent's capacity and is predictable:

```v
mut a := []int{len: 5, cap: 6, init: 2}
mut b := a[1..4]
a << 3
// no reallocation - fits in `cap`
b[2] = 13 // `a[3]` is modified
a << 4
// a has been reallocated and is now independent from `b` (`cap` was exceeded)
b[1] = 3 // no change in `a`
println(a) // `[2, 2, 2, 13, 2, 3, 4]`
println(b) // `[2, 3, 13]`
```

You can call .clone() on the slice, if you do want to have an independent copy right away:

```v
mut a := [0, 1, 2, 3, 4, 5]
mut b := a[2..4].clone()
b[0] = 7 // Note: `b[0]` is NOT referring to `a[2]`, as it would have been, without the .clone()
println(a) // [0, 1, 2, 3, 4, 5]
println(b) // [7, 3]
```

##### Slices with negative indexes

V supports array and string slices with negative indexes.
Negative indexing starts from the end of the array towards the start,
for example `-3` is equal to `array.len - 3`.
Negative slices have a different syntax from normal slices, i.e. you need
to add a `gate` between the array name and the square bracket: `a#[..-3]`.
The `gate` specifies that this is a different type of slice and remember that
the result is "locked" inside the array.
The returned slice is always a valid array, though it may be empty:

```v
a := [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
println(a#[-3..]) // [7, 8, 9]
println(a#[-20..]) // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
println(a#[-20..-8]) // [0, 1]
println(a#[..-3]) // [0, 1, 2, 3, 4, 5, 6]

// empty arrays
println(a#[-20..-10]) // []
println(a#[20..10]) // []
println(a#[20..30]) // []
```

#### Array method chaining

You can chain the calls of array methods like `.filter()` and `.map()` and use
the `it` built-in variable to achieve a classic `map/filter` functional paradigm:

```v
// using filter, map and negatives array slices
files := ['pippo.jpg', '01.bmp', '_v.txt', 'img_02.jpg', 'img_01.JPG']
filtered := files.filter(it#[-4..].to_lower() == '.jpg').map(it.to_upper())
// ['PIPPO.JPG', 'IMG_02.JPG', 'IMG_01.JPG']
```

### Fixed size arrays

V also supports arrays with fixed size. Unlike ordinary arrays, their
length is constant. You cannot append elements to them, nor shrink them.
You can only modify their elements in place.

However, access to the elements of fixed size arrays is more efficient,
they need less memory than ordinary arrays, and unlike ordinary arrays,
their data is on the stack, so you may want to use them as buffers if you
do not want additional heap allocations.

Most methods are defined to work on ordinary arrays, not on fixed size arrays.
You can convert a fixed size array to an ordinary array with slicing:

```v
mut fnums := [3]int{} // fnums is a fixed size array with 3 elements.
fnums[0] = 1
fnums[1] = 10
fnums[2] = 100
println(fnums) // => [1, 10, 100]
println(typeof(fnums).name) // => [3]int

fnums2 := [1, 10, 100]! // short init syntax that does the same (the syntax will probably change)

anums := fnums[..] // same as `anums := fnums[0..fnums.len]`
println(anums) // => [1, 10, 100]
println(typeof(anums).name) // => []int
```

Note that slicing will cause the data of the fixed size array to be copied to
the newly created ordinary array.

### Maps

```v
mut m := map[string]int{} // a map with `string` keys and `int` values
m['one'] = 1
m['two'] = 2
println(m['one']) // "1"
println(m['bad_key']) // "0"
println('bad_key' in m) // Use `in` to detect whether such key exists
println(m.keys()) // ['one', 'two']
m.delete('two')
```

Maps can have keys of type string, rune, integer, float or voidptr.

The whole map can be initialized using this short syntax:

```v
numbers := {
	'one': 1
	'two': 2
}
println(numbers)
```

If a key is not found, a zero value is returned by default:

```v
sm := {
	'abc': 'xyz'
}
val := sm['bad_key']
println(val) // ''
```

```v
intm := {
	1: 1234
	2: 5678
}
s := intm[3]
println(s) // 0
```

It's also possible to use an `or {}` block to handle missing keys:

```v
mm := map[string]int{}
val := mm['bad_key'] or { panic('key not found') }
```

You can also check, if a key is present, and get its value, if it was present, in one go:

```v
m := {
	'abc': 'def'
}
if v := m['abc'] {
	println('the map value for that key is: ${v}')
}
```

The same option check applies to arrays:

```v
arr := [1, 2, 3]
large_index := 999
val := arr[large_index] or { panic('out of bounds') }
println(val)
// you can also do this, if you want to *propagate* the access error:
val2 := arr[333]!
println(val2)
```

V also supports nested maps:

```v
mut m := map[string]map[string]int{}
m['greet'] = {
	'Hello': 1
}
m['place'] = {
	'world': 2
}
m['code']['orange'] = 123
print(m)
```

Maps are ordered by insertion, like dictionaries in Python. The order is a
guaranteed language feature. This may change in the future.

See all methods of
[map](https://modules.vlang.io/index.html#map)
and
[maps](https://modules.vlang.io/maps.html).


<p>
<a align="left" href="appendices.md">&larr; Appendices</a>

<a align="right" href="module_imports.md">Module Imports &rarr;</a>
</p>
