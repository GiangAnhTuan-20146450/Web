package Nvidia.services;

import java.util.List;

import Nvidia.models.CategoryModels;

public interface ICategoryService {
	//dinh nghia cac phuong thuc
	List<CategoryModels> findAll();
	
	void insert(CategoryModels model);

	CategoryModels findOne(int id);
	
	void update(CategoryModels model);
	
	void delete(int id);
}
