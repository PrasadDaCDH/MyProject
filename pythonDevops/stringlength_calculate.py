#find out the string length

def str(mystring):
    length=0
    for i in mystring:
        length=length+1
    return length





mystring=input('please enter the string')

#driver code
print('the string length is   :',str(mystring))
