package study2.api;

public class CrimeVO {
	private int idx;
	private int year;
	private String police;
	private int burglar;
	private int murder;
	private int theft;
	private int violence;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getPolice() {
		return police;
	}
	public void setPolice(String police) {
		this.police = police;
	}
	public int getBurglar() {
		return burglar;
	}
	public void setBurglar(int burglar) {
		this.burglar = burglar;
	}
	public int getMurder() {
		return murder;
	}
	public void setMurder(int murder) {
		this.murder = murder;
	}
	public int getTheft() {
		return theft;
	}
	public void setTheft(int theft) {
		this.theft = theft;
	}
	public int getViolence() {
		return violence;
	}
	public void setViolence(int violence) {
		this.violence = violence;
	}

	@Override
	public String toString() {
		return "CrimeVO [idx=" + idx + ", year=" + year + ", police=" + police + ", burglar=" + burglar + ", murder="
				+ murder + ", theft=" + theft + ", violence=" + violence + "]";
	}
	
}
