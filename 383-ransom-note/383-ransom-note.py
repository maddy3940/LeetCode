class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        
        
        a = Counter(ransomNote)
        b = Counter(magazine) 
        
        print(a)
        print(b)
        
        for k,v in a.items():
            if b[k]<v:
                return False
        
        return True
            