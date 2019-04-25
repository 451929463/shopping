package cn.tri.shop.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tri.shop.mapper.TypeCommodityMapper;
import cn.tri.shop.pojo.TypeCommodity;
import cn.tri.shop.service.TypeCommodityService;
@Service("typeCommodityService")
public class TypeCommodityServiceImpl implements TypeCommodityService{
	@Autowired
	private TypeCommodityMapper typeCommodityMapper;
	

	public void setTypeCommodityMapper(TypeCommodityMapper typeCommodityMapper) {
		this.typeCommodityMapper = typeCommodityMapper;
	}


	@Override
	public List<TypeCommodity> findAll() {
		return typeCommodityMapper.findAll();
	}
	
}
