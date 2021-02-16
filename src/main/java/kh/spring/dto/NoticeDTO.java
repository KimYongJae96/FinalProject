package kh.spring.dto;

public class NoticeDTO {
	private int n_seq;
	private int rn;
	private String title;
	private String writedate;
	private String contents;
	private String file;
	private int view_count;
	
	public NoticeDTO() {}

	public NoticeDTO(int n_seq, int rn, String title, String writedate, String contents, String file, int view_count) {
		this.n_seq = n_seq;
		this.rn = rn;
		this.title = title;
		this.writedate = writedate;
		this.contents = contents;
		this.file = file;
		this.view_count = view_count;
	}

	public int getN_seq() {
		return n_seq;
	}

	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	
}
