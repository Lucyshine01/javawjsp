package study.j1116h;

public class ProductVO {
	private String[] type;
	private String[] p_name;
	private String[] p_price;
	private String[] p_count;
	
	public ProductVO(String[] type, String[] p_name, String[] p_price, String[] p_count) {
		super();
		this.type = type;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_count = p_count;
	}
	
	public String[] getType() {
		return type;
	}

	public void setType(String[] type) {
		this.type = type;
	}

	public String[] getP_name() {
		return p_name;
	}

	public void setP_name(String[] p_name) {
		this.p_name = p_name;
	}

	public String[] getP_price() {
		return p_price;
	}

	public void setP_price(String[] p_price) {
		this.p_price = p_price;
	}

	public String[] getP_count() {
		return p_count;
	}

	public void setP_count(String[] p_count) {
		this.p_count = p_count;
	}

	public String toString() {
		return "ProductVO [type=" + type + ", p_name=" + p_name + ", p_price=" + p_price + ", p_count=" + p_count + "]";
	}
	
}
