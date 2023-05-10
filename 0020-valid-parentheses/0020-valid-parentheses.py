class Solution:
    def isValid(self, s: str) -> bool:
        
        
        stack=[]
        
        d={"(":")",
           "{":"}",
           "[":"]"}
        
        
        for i in range(len(s)):
            
            if s[i] in d.keys():
                stack.append(s[i])
            
            else:
            
                if len(stack)==0 or d[stack.pop()]!=s[i]:
                    return False
        if len(stack)!=0:
            return False
        else: 
            return True
                    