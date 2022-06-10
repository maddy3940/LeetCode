class Solution:
    def romanToInt(self, s: str) -> int:
        
        
        res=[]
        for i in s:
            if i =='I':
                res.append(1)
                
            elif i=='V':
                res.append(5)
                
            elif i=='X':
                res.append(10)
            
            elif i=='L':
                res.append(50)
                
            elif i=='C':
                res.append(100)
                
            elif i=='D':
                res.append(500)
                
            elif i=='M':
                res.append(1000)
                
        print(res)
        for i in range(len(res)-1):
            
            if res[i]<res[i+1]:
                res[i]=res[i+1]-res[i]
                res[i+1]=9999
                
        sum=0
        for i in res:
            if i!=9999:
                sum+=i
        return sum
            
        
                