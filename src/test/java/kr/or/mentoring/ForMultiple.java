package kr.or.mentoring;

public class ForMultiple {
	public static void main(String[] args) {
		// 구구단 2~9단
		// 2X1=2
		// 2X2=4
		// ...
		// -------------
		// ...
		// 9X1=9
		// ...
		// 9X9=81
		// 변수는 변하는 수 이므로 i = 1~9
		for(int i=1 ; i<10 ; i++) {
			for(int j=2; j<10 ; j++) {
				System.out.print(j+"X"+i+"="+(j*i)+"\t");
			}
			System.out.println();
		}
	}
	
}