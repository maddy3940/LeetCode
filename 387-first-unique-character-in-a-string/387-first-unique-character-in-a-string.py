class Solution:
    def firstUniqChar(self, s: str) -> int:
        
        h1={}
        h2={}
        
        for i in range(len(s)):
            h1[s[i]]=i
            h2[s[i]]=h2.get(s[i],0)+1
        
        
        for k,v in h2.items():
            if v==1:
                return h1[k]
            
        return -1
        
        
        
        
        
        