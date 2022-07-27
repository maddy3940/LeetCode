class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        
        
        row=-1
        for i in range(0,len(matrix)):
            if matrix[i][len(matrix[0])-1]>=target:
                row=i
                print(row)
                break
            
            
        if row==-1:
            return False
        else:
            for i in range(len(matrix[0])):
                if matrix[row][i]==target:
                    return True
                
            return False
            
            
        