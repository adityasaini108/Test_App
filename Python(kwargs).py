def fun1(**kwargs):

    print("1. Dictionary:", kwargs)
    
    print("2. Keys:", list(kwargs.keys()))
    
    print("3. Values:", list(kwargs.values()))
    
    total_sum = sum(kwargs.values())
    print("4. Sum of values:", total_sum)
    
    if kwargs:
        average = total_sum / len(kwargs)
    else:
        average = 0
    print("5. Average of values:", average)

fun1(a=30, b=40, c=50, d=60, e=70, f=20)