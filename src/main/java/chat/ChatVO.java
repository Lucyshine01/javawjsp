package chat;

public class ChatVO {
	private int idx;
	private String nickName;
	private String content;
	private String cDate;
	private String avatar;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getcDate() {
		return cDate;
	}
	public void setcDate(String cDate) {
		this.cDate = cDate;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	@Override
	public String toString() {
		return "ChatVO [idx=" + idx + ", nickName=" + nickName + ", content=" + content + ", cDate=" + cDate + ", avatar="
				+ avatar + "]";
	}
}
