package Nvidia.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Nvidia.models.CategoryModels;
import Nvidia.models.ProductModel;

public class ProductDAOImpl implements IProductDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	ICategoryDAO cateDao = new CategoryDAOimpl();

	@Override
	public List<ProductModel> findAll() {
		String sql = "select * from product";
		List<ProductModel> list = new ArrayList<ProductModel>();
		try {
			new DBConnection();
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel model = new ProductModel();
				model.setProductID(rs.getInt(1));
				model.setProductName(rs.getString(2));
				model.setDesc(rs.getString(3));
				model.setPrice(rs.getInt(4));
				model.setImageLink(rs.getString(5));
				model.setCategoryID(rs.getInt(6));
				model.setSellerID(rs.getInt(7));
				model.setAmount(rs.getInt(8));
				model.setStoke(rs.getInt(9));
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductModel> findProductByCategory(int cateID) {
		String sql = "select * from product where CategoryID=?";
		List<ProductModel> list = new ArrayList<ProductModel>();
		try {
			new DBConnection();
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cateID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CategoryModels model1 = cateDao.findOne(rs.getInt("CategoryID"));
				ProductModel model = new ProductModel();
				model.setProductID(rs.getInt("ProductID"));
				model.setProductName(rs.getString("ProductName"));
				model.setDesc(rs.getString("Description"));
				model.setPrice(rs.getInt("Price"));
				model.setImageLink(rs.getString("imageLink"));
				model.setCategoryID(model1.getCateID());
				model.setSellerID(rs.getInt("SellerID"));
				model.setAmount(rs.getInt("Amount"));
				model.setStoke(rs.getInt("stoke"));
				model.setCategory(model1);
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public void insert(ProductModel model) {
		String sql = "insert into product(productName,description,price,imageLink,categoryID,stoke) values(?,?,?,?,?,?)";
		try {
			new DBConnection();
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, model.getProductName());
			ps.setString(2, model.getDesc());
			ps.setInt(3, model.getPrice());
			ps.setString(4, model.getImageLink());
			ps.setInt(5, model.getCategory().getCateID());
			ps.setInt(6, model.getStoke());

			ps.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void update(ProductModel model) {
		String sql = "update product set productName=?,description=?,price=?,imageLink=?,categoryID=?,stoke=? where ProductID";
		try {
			new DBConnection();
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, model.getProductName());
			ps.setString(2, model.getDesc());
			ps.setInt(3, model.getPrice());
			ps.setString(4, model.getImageLink());
			ps.setInt(5, model.getCategory().getCateID());
			ps.setInt(6, model.getStoke());
			ps.setInt(7, model.getProductID());

			ps.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public ProductModel findOne(int id) {
		String sql = "select * from product where ProductID=?";
		ProductModel model = new ProductModel();
		try {
			new DBConnection();
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CategoryModels model1 = cateDao.findOne(rs.getInt("CategoryID"));
				model.setProductID(rs.getInt("ProductID"));
				model.setProductName(rs.getString("ProductName"));
				model.setDesc(rs.getString("Description"));
				model.setPrice(rs.getInt("Price"));
				model.setImageLink(rs.getString("imageLink"));
				model.setCategoryID(model1.getCateID());
				model.setSellerID(rs.getInt("SellerID"));
				model.setAmount(rs.getInt("Amount"));
				model.setStoke(rs.getInt("stoke"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@Override
	public void delete(int id) {
		String sql = "DELETE FROM nvidia.product WHERE ProductID=?";
		try {
			new DBConnection();
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(sql);
			// gan gia tri cho tham so
			ps.setInt(1, id);
			ps.executeUpdate(); // thực thi câu query và trả về Resultset
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		IProductDAO proDao = new ProductDAOImpl();
		List<ProductModel> list1 = proDao.count();
		System.out.println(list1);
	}

	@Override
	public int countByCateID(int id) {
		String sql = "select count(*) from product where CategoryID=?";
		try {
			new DBConnection();
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {

		}
		return 0;
	}

	@Override
	public List<ProductModel> count() {
		List<ProductModel> list = new ArrayList<ProductModel>();
		String sql = "SELECT CategoryID, COUNT(*) as count FROM Product GROUP BY categoryID Order By count DESC";
		try {
			new DBConnection();
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				list.add(new ProductModel(rs.getInt(1), rs.getInt(2)));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<ProductModel> find10Top() {
		String sql = "SELECT * FROM nvidia.product ORDER BY ProductID ASC LIMIT 10";
		List<ProductModel> list = new ArrayList<ProductModel>();
		try {
			new DBConnection();
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductModel model = new ProductModel();
				model.setProductID(rs.getInt(1));
				model.setProductName(rs.getString(2));
				model.setDesc(rs.getString(3));
				model.setPrice(rs.getInt(4));
				model.setImageLink(rs.getString(5));
				model.setCategoryID(rs.getInt(6));
				model.setSellerID(rs.getInt(7));
				model.setAmount(rs.getInt(8));
				model.setStoke(rs.getInt(9));
				CategoryModels model1 = cateDao.findOne(model.getCategoryID());
				model.setCategory(model1);
				list.add(model);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
