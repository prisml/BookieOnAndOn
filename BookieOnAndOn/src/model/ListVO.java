package model;

import java.util.ArrayList;

public class ListVO {
	private ArrayList<VO> list;
	private PagingBean pagingBean;

	public ListVO() {
		super();
	}

	public ListVO(ArrayList<VO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public ArrayList<VO> getList() {
		return list;
	}

	public void setList(ArrayList<VO> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "ListVO [pagingBean=" + pagingBean + "]";
	}
}
