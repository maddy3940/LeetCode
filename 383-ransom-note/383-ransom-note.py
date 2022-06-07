class Solution:
    def canConstruct(self, ransomNote: str, magazine: str) -> bool:
        
        count=[]
        
        count1=collections.Counter(magazine)
        
        print(count1)
        for i in ransomNote:
            
            if count1[i]<1:
                return False
            
            count1[i]=count1[i]-1
            
        return True