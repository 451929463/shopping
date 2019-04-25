package cn.tri.shop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.tri.shop.pojo.TypeCommodity;

public interface TypeCommodityService {
	public List<TypeCommodity> findAll();
}
