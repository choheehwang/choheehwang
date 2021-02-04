package kr.or.mentoring;

public class WhileTest {

	public static void main(String[] args) {
		// 1~10까지 합
		int sum = 0;
		int i = 1;
		while(i<101) {
			sum += i;
			i++;
		}
		System.out.println("1~100까지 합: " + sum);
	}

}