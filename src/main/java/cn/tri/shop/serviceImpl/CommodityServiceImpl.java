package cn.tri.shop.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tri.shop.mapper.CommodityMapper;
import cn.tri.shop.pojo.Commodity;
import cn.tri.shop.service.CommodityService;
@Service("commodityServiceImpl")
public class CommodityServiceImpl implements CommodityService{
	@Autowired
	private CommodityMapper commodityMapper ;
	

	public void setCommodityMapper(CommodityMapper commodityMapper) {
		this.commodityMapper = commodityMapper;
	}


	@Override
	public List<Commodity> findBytid(int tid) {
		return commodityMapper.findBytid(tid);
	}


	@Override
	public void addCommodity(Commodity commodity) {
		commodityMapper.addCommodity(commodity);
	}


	@Override
	public Commodity findBycid(int id) {
		return commodityMapper.findBycid(id);
	}


	@Override
	public void alterCommodity(Commodity commodity) {
		commodityMapper.alterCommodity(commodity);
	}


	@Override
	public void deleteCommodity(int cid) {
		commodityMapper.deleteCommodity(cid);
	}


	@Override
	public List<Commodity> findByHot(int hot) {
		return commodityMapper.findByHot(hot);
	}

}
