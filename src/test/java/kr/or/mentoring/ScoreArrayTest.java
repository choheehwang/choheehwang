package kr.or.mentoring;

public class ScoreArrayTest {

	public static void main(String[] args) {
		// A반 학생 점수가 75,87,95,66,98인 score 배열 선언
		// A반 학생 점수의 총점과 평균(소수점자리까지) 구하기
		int[] scores = {75,87,95,66,98};
		int sum = 0;
		for(int i=0;i<scores.length;i++) {
			sum += scores[i];
		}
		System.out.println("총합: "+sum);
		double avg = (double)sum/scores.length;
		System.out.println("평균: "+avg);
	}

}
