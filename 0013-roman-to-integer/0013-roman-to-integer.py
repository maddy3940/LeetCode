class Solution:
    def romanToInt(self, s: str) -> int:
        
        
        d={'I':1,'V':5,'X':10,'L':50,'C':100,'D':500,'M':1000}
        k=[]
        
        for i in range(len(s)):
            k.append(int(d[s[i]]))
                
        res=k[0]
        for i in range(1,len(k)):
            
            if k[i]>k[i-1]:
                res-=k[i-1]
                res+=k[i]-k[i-1]
            else:
                res+=k[i]
                
        
        print(res)

        return res