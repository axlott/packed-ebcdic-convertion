import ebcdic
import re

def unpack(mypacked):     
    bline = mypacked.encode('cp1141')
    #bline = line.encode('cp1252')
    return re.split(pattern= r"[cdf]",string=bline.hex())


if __name__ == '__main__':
    file = open("E:/axelo/Desktop/Scripts/COBOL/filo.txt","r",encoding="cp1141")
    #file = open("your-file.txt",'r',encoding="cp1141")
    list=[]
    for line in file:
        print(unpack(line))
    file.close()
