#collect and find average of numbers


def collect(num):
    for i in range(0,num):
        temp= float(input('please enter the num to add  '))
        mylist.append(temp)


def averagenum():
    total=0
    for i in range(0,len(mylist)):
        total=total+mylist[i]

    return(total/numbers)








mylist = []

numbers=int(input('please enter the number of list you want to add'))
collect(numbers)

print('average of the total number is',averagenum())
