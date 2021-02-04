package kr.or.mentoring;

public class ArrayCreateTest {

	public static void main(String[] args) {
		// 길이가 5인 intArray 선언
		// 1~5까지 차례대로 대입(for문으로 대입)
		// Result: "5 4 3 2 1"
		int[] intArray = new int[5];
		int num = 5;
		// 입력부
		for(int i=intArray.length-1; i>=0; i--) {
			intArray[i] = num++;
		}
		// 출력부
		// 입력부에 sysout을 입력할 시 12345 이런 형식으로 출력된다.
		// 입력은 우측에서부터 시작되었으나 출력은 좌측에서부터 시작되기 때문이다.
		// 그러므로 입력부와 출력부는 나눠야 한다.
		for(int i=0; i<intArray.length; i++) {
			System.out.print(intArray[i]+" ");
		}
	}

}
