package kr.or.mentoring;

public class Page134Exercise03 {

	public static void main(String[] args) {
		// 이것이 자바다 p.134 3번 예제
		// 1~100까지 정수 중 3의 배수 총합 구하기
		int sum = 0;
		for(int i=1; i<101 ;i++) {
			if(i%3 == 0) {
				sum += i;
			}
		}
		System.out.println("1~100까지 정수 중 3의 배수 총합: "+sum);
	}

}