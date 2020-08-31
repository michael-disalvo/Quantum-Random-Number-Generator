#this program will host the quantum random bit generator 
import qsharp
import QuantumRNG

generate = False

while (generate == False):
    print(' ')
    print("Welcome to the truly random Quantum Number Generator!")
    min_val = int(input("What is the minimum value? "))
    max_val = int(input("What is the maximum value? "))
    n = int(input("How many integers do you need? " ))
    print("Thank you, you're truly random numbers will be ready shortly!")


    if (min_val < max_val):
        generate = True
    elif (min_val > max_val):
        response = input("Your min was greater than your max, do you want us to switch them? [Y/N]:  ")
        if (response.upper() == 'Y' or response == 'Yes' or response == 'yes'):
            x = min_val
            min_val = max_val
            max_val = x 
            generate = True
        else:
            continue
    else: 
        print("Your min and max are the same, please try again.")
        continue

    if (generate == True):    
        for i in range(n) : 
            print(QuantumRNG.SampleRandomNumber.simulate(min=min_val, max=max_val), " ")
