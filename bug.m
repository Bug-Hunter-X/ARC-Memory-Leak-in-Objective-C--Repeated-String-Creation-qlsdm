In Objective-C, a common yet subtle error arises when dealing with object ownership and memory management using Automatic Reference Counting (ARC).  Consider this scenario:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)someMethod {
    self.myString = [NSString stringWithFormat:@"Hello, world!"];
    // ... some code ...
}
@end
```

If `someMethod` is called multiple times,  each call creates a new `NSString` object, and the previous one is retained by `myString`.  The old `NSString` object isn't released until the `MyClass` object itself is deallocated, resulting in memory leaks. This happens because we are using `self.myString` which uses the setter method that strongly retains the new string.  If you don't need to keep the old string around, you need to handle the release correctly. 