package kr.or.mentoring;

public class ForTest {

	public static void main(String[] args) {
		int sum = 0;
		for(int i=1 ; i<11 ; i++) {
			sum += i; // sum = sum + i
		}
		System.out.println("1~10까지 합은: " + sum);
	}

}