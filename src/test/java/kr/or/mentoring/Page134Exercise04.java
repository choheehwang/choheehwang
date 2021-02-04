package kr.or.mentoring;

public class Page134Exercise04 {

	public static void main(String[] args) {
		// 이것이 자바다 p.134 4번 예제
		while(true) {
			int a = (int)(Math.random()*6)+1;
			int b = (int)(Math.random()*6)+1;
			System.out.println("("+a+","+b+")"); // if문에 넣으면 a+b의 합이 5일 때만 출력하므로 X
			if(a+b==5) {
				break;
			}
		}
	}

}