package Nvidia.controllers.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import Nvidia.models.CategoryModels;
import Nvidia.models.ProductModel;
import Nvidia.services.CategoryServiceImpl;
import Nvidia.services.ICategoryService;
import Nvidia.services.IProductService;
import Nvidia.services.ProductServiceImpl;
import Nvidia.utils.Constant;
import Nvidia.utils.UploadUtils;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024
		* 50)

@WebServlet(urlPatterns = { "/product/listproduct", "/product/findprobycate", "/product/admin-insertpro","/product/delete" })
public class ProductController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	IProductService proService = new ProductServiceImpl();
	ICategoryService cateService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if (url.contains("listproduct")) {

			List<ProductModel> list = proService.findAll();
			req.setAttribute("listpro", list);

			RequestDispatcher rd = req.getRequestDispatcher("/views/product/listProduct.jsp");
			rd.forward(req, resp);

		} else if (url.contains("findprobycate")) {
			int id = Integer.parseInt(req.getParameter("cateID"));

			List<ProductModel> list1 = proService.findProductByCategory(id);
			req.setAttribute("listpro", list1);

			RequestDispatcher rd = req.getRequestDispatcher("/views/product/listProduct.jsp");
			rd.forward(req, resp);

		} else if (url.contains("admin-insertpro")) {
			List<CategoryModels> list = cateService.findAll();
			req.setAttribute("list", list);
			RequestDispatcher rd = req.getRequestDispatcher("/views/product/addProduct.jsp");
			rd.forward(req, resp);
		} else if (url.contains("delete")) {
			delete(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		if (url.contains("admin-insertpro")) {
			insert(req, resp);
			List<ProductModel> list = proService.findAll();
			req.setAttribute("listpro", list);

			RequestDispatcher rd = req.getRequestDispatcher("/views/product/listProduct.jsp");
			rd.forward(req, resp);

		}

	}

	private void insert(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		ProductModel model = new ProductModel();
		try {
			// lay du lieu tu jsp bang beanUtils
			BeanUtils.populate(model, req.getParameterMap());
			// xu ly truong image
			if (req.getPart("imageLink").getSize() != 0) {
				String fileName = "" + System.currentTimeMillis();
				model.setImageLink(UploadUtils.processUpload("imageLink", req, Constant.DIR + "\\product\\", fileName));
			}
			model.setCategory(cateService.findOne(model.getCategoryID()));

			proService.insert(model);

			// thong bao
			req.setAttribute("product", model);
			req.setAttribute("message", "Add successful");

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Add fails");
		}

		// resp.sendRedirect(req.getContextPath() + "/listproduct");

	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		int id = Integer.parseInt(req.getParameter("id"));
		try {
			proService.delete(id);
			req.setAttribute("message", "Xoá thành công");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("error", "Thất bại");
		}
		RequestDispatcher rd = req.getRequestDispatcher("listproduct");
		rd.forward(req, resp);

	}
}
