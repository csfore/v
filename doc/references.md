## References

```v
struct Foo {}

fn (foo Foo) bar_method() {
	// ...
}

fn bar_function(foo Foo) {
	// ...
}
```

If a function argument is immutable (like `foo` in the examples above)
V can pass it either by value or by reference. The compiler will decide,
and the developer doesn't need to think about it.

You no longer need to remember whether you should pass the struct by value
or by reference.

You can ensure that the struct is always passed by reference by
adding `&`:

```v
struct Foo {
	abc int
}

fn (foo &Foo) bar() {
	println(foo.abc)
}
```

`foo` is still immutable and can't be changed. For that,
`(mut foo Foo)` must be used.

In general, V's references are similar to Go pointers and C++ references.
For example, a generic tree structure definition would look like this:

```v
struct Node[T] {
	val   T
	left  &Node[T]
	right &Node[T]
}
```

To dereference a reference, use the `*` operator, just like in C.

<p align="center">
<a href="functions2.md">&larr; Functions 2</a>
 | 
<a href="constants.md">Constants &rarr;</a>
</p>