class Solution(object):
    def searchMatrix(self, matrix, target):
        """
        :type matrix: List[List[int]]
        :type target: int
        :rtype: bool
        """    
        for i in range(len(matrix)):
            if matrix[i][-1]>=target:
                for j in range(len(matrix[0])):
                    if matrix[i][j]==target:
                        return True
        return False