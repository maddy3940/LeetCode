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
            one_row=matrix[row]
            
            left=0
            right=len(one_row)-1
            
            while left<=right:
                pivot=(left+right)//2
                
                if one_row[pivot]==target:
                    return True
                elif target<one_row[pivot]:
                    right=pivot-1
                else:
                    left=pivot+1
                
            
            
            
            
            
        