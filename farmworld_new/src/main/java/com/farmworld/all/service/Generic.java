package com.farmworld.all.service;


public interface Generic<VO, K> {
	
	public VO get(K k);

	public void add(VO vo);

	public void modify(VO vo);

	public void delete(K k);
	
}
