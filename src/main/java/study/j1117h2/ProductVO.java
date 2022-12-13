package study.j1117h2;

import java.util.Arrays;

public class ProductVO {
	private String[] type;
	private String[] p_name;
	private String[] p_price;
	private String[] p_count;
	private String id;
	@Override
	public String toString() {
		return "ProductVO [type=" + Arrays.toString(type) + ", p_name=" + Arrays.toString(p_name) + ", p_price="
				+ Arrays.toString(p_price) + ", p_count=" + Arrays.toString(p_count) + ", id=" + id + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
}
