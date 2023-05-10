class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        
        
        strs=sorted(strs)
        
        a = strs[0]
        b=strs[-1]
        l = min(len(a),len(b))
        res=''
        for i in range(l):
            if a[i]==b[i]:
                res+=a[i]
            else:
                return res

        return res