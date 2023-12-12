package Nvidia.services;

import java.util.List;

import Nvidia.DAO.IProductDAO;
import Nvidia.DAO.ProductDAOImpl;
import Nvidia.models.ProductModel;

public class ProductServiceImpl implements IProductService {
	IProductDAO proDao = new ProductDAOImpl();

	public List<ProductModel> findAll() {
		
		return proDao.findAll();
	}

	public List<ProductModel> findProductByCategory(int cateID) {
		
		return proDao.findProductByCategory(cateID);
	}

	@Override
	public void insert(ProductModel model) {
		proDao.insert(model);
		
	}

	@Override
	public void update(ProductModel model) {
		
		ProductModel newPro = proDao.findOne(model.getProductID());
		newPro.setProductName(model.getProductName());
		newPro.setDesc(model.getDesc());
		newPro.setPrice(model.getPrice());
		newPro.setImageLink(model.getImageLink());
		newPro.setCategory(model.getCategory());
		newPro.setStoke(model.getStoke());
		
		proDao.update(newPro);
		
	}

	@Override
	public ProductModel findOne(int id) {
		
		return proDao.findOne(id);
	}
	
	@Override
	public int countByCateID(int id) {
		
		return proDao.countByCateID(id);
	}
	
	@Override
	public List<ProductModel> find10Top() {
		
		return proDao.find10Top();
	}

	@Override
	public List<ProductModel> count() {
		
		return proDao.count();
	}
	
	@Override
	public void delete(int id) {
		proDao.delete(id);
	}

}
