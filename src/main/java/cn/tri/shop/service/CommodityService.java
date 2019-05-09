package cn.tri.shop.service;

import java.util.List;

import cn.tri.shop.pojo.Commodity;

public interface CommodityService {
	public List<Commodity> findBytid(int tid,int index,int size);
	public void addCommodity(Commodity commodity);
	public Commodity findBycid(int id);
	public void alterCommodity(Commodity commodity);
	public void deleteCommodity(int cid);
	public List<Commodity> findByHot(int hot);
}
