package cn.tri.shop.mapper;

import java.util.List;

import cn.tri.shop.pojo.Commodity;
import cn.tri.shop.pojo.ParamLimit;

public interface CommodityMapper {
	public int findBytidCount(int tid);
	public List<Commodity> findBytid(ParamLimit pl);
	public void addCommodity(Commodity commodity);
	public Commodity findBycid(int id);
	public void alterCommodity(Commodity commodity);
	public void deleteCommodity(int cid);
	public List<Commodity> findByHot(int hot);
	
}
