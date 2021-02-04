package kr.or.mentoring;

public class Page135Exercise05 {

	public static void main(String[] args) {
		// 이것이 자바다 p.135 5번 예제
		for(int x=1; x<11; x++) {
			for(int y=1; y<11; y++) {
				if(4*x+5*y==60) {
					System.out.println("("+x+","+y+")");
				}
			}
		}
	}

}
