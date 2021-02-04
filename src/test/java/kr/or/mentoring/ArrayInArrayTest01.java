package kr.or.mentoring;

public class ArrayInArrayTest01 {

	public static void main(String[] args) {
		// 길이가 4x3인 intArray 배열 선언
		// 1~12까지 차례대로 삽입
		// 예상 결과(아래)
		// 1 2 3
		// 4 5 6
		// 7 8 9
		// 10 11 12
		int[][] intArray = new int[4][3];
		int num = 1;
		for(int i=0; i<intArray.length; i++) {
			for(int j=0; j<intArray[i].length; j++) {
				intArray[i][j] = num++;
				System.out.print(intArray[i][j]+" ");
			}System.out.println();
		}

	}

}
