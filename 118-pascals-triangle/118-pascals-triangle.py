class Solution:
    def generate(self, numRows: int) -> List[List[int]]:
        
        
        
        res=[[1]]
        for i in range(2,numRows+1):
            
            one_row=[1]
            for j in range(1,i-1):
                print(i,j)
                one_row.append(res[i-2][j-1]+res[i-2][j])
            one_row.append(1)
            
            res.append(one_row)
        
        return(res)