package cn.tri.shop.mapper;

import java.util.List;
import cn.tri.shop.pojo.Commodity;

public interface CommodityMapper {
	public List<Commodity> findBytid(int tid);
	public void addCommodity(Commodity commodity);
	public Commodity findBycid(int id);
	public void alterCommodity(Commodity commodity);
	public void deleteCommodity(int cid);
	public List<Commodity> findByHot(int hot);
	
}
