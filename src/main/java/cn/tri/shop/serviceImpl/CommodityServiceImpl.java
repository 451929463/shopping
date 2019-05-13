package cn.tri.shop.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tri.shop.mapper.CommodityMapper;
import cn.tri.shop.pojo.Commodity;
import cn.tri.shop.pojo.PageBean;
import cn.tri.shop.pojo.ParamLimit;
import cn.tri.shop.service.CommodityService;
@Service("commodityServiceImpl")
public class CommodityServiceImpl implements CommodityService{
	@Autowired
	private CommodityMapper commodityMapper ;
	

	public void setCommodityMapper(CommodityMapper commodityMapper) {
		this.commodityMapper = commodityMapper;
	}

	@Override
	public PageBean findBytid(int tid,int pageNum,int pageSize) {
		int totalRecord = commodityMapper.findBytidCount(tid);
		PageBean pb = new PageBean(pageNum, pageSize, totalRecord);
		int startIndex = pb.getStartIndex();
		ParamLimit pl = new ParamLimit(tid, startIndex, pageSize);
		pb.setList(commodityMapper.findBytid(pl));
		return pb;
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
