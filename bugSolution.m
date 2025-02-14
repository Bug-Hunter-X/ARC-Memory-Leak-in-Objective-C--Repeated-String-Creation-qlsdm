The solution involves directly assigning to the instance variable instead of using the property setter, ensuring the old string is released before allocating the new one:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    _myString = [NSString stringWithFormat:@"Hello, world!"]; // Access directly using underscore
    // ... some code ...
}
@end
```

Alternatively, you can explicitly release the old string, but this is generally not recommended with ARC.  The direct access using the underscore is cleaner and safer in this case.  For more complex object lifetimes, using techniques like weak references or explicit memory management might be necessary, but should be carefully considered and rarely needed with ARC.