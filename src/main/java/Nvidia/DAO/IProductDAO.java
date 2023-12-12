package Nvidia.DAO;

import java.util.List;

import Nvidia.models.ProductModel;

public interface IProductDAO {
	
	List<ProductModel> findAll();
	List<ProductModel> find10Top();
	List<ProductModel> findProductByCategory(int cateID);
	
	void insert(ProductModel model);
	
	void update(ProductModel model);
	
	void delete(int id);
	
	ProductModel findOne(int id);
	
	int countByCateID(int id);
	
	List<ProductModel> count();
	
	

}
