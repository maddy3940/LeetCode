class Solution:
    def firstUniqChar(self, s: str) -> int:

        d={}
        e={}

        for i in range(len(s)):
            d[s[i]]=d.get(s[i],0)+1
            e[s[i]]=i

        
        #print(d)
        #print(e)
        for k,v in d.items():
            if v==1:
                return(e[k])
                break
        return -1
        