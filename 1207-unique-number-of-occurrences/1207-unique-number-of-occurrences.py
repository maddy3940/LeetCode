class Solution:
    def uniqueOccurrences(self, arr: List[int]) -> bool:
        
        d={}
        for i in range(len(arr)):
            d[arr[i]]= d.get(arr[i],0)+1

        x=[]

        
        for k,v in d.items():
            if v in x:
                return False
            else:                    
                x.append(v)
                
        return True
            
        