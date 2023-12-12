package Nvidia.services;

import java.util.List;

import Nvidia.models.ProductModel;

public interface IProductService {
	
	List<ProductModel> findAll();
	List<ProductModel> findProductByCategory(int cateID);
	
	void insert(ProductModel model);
	
	void update(ProductModel model);
	
	void delete(int id);
	
	ProductModel findOne(int id);
	List<ProductModel> find10Top();
	
	
	List<ProductModel> count();
	int countByCateID(int id);

}
