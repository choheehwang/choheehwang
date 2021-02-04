package kr.or.mentoring;

public class IfNumTest {

	public static void main(String[] args) {
		int num = 70;
		if(num%2 == 0 && ((num/10)+(num%10) == 7)) {
			System.out.println("Lucky!");
		}else {
			System.out.println("Bad!");
		}
	}

}