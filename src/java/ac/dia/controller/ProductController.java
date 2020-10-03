package ac.dia.controller;

import ac.dia.dao.ProductDao;
import ac.dia.entity.Product;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

    @Autowired
    private ProductDao productDao;

    @RequestMapping(value = "/productpage", method = RequestMethod.GET)
    public String loadProductPage(ModelMap modelMap, HttpServletRequest request) {

        List<Product> products = productDao.getAllProduct();
        modelMap.addAttribute("products", products);

        modelMap.addAttribute("sm", request.getParameter("sm"));
        modelMap.addAttribute("em", request.getParameter("em"));

        return "productpage";
    }

    @RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
    public String saveProduct(ModelMap modelMap, HttpServletRequest request) {

        Product product = new Product();
        product.setPname(request.getParameter("pname"));
        try {
            product.setPrice(Double.parseDouble(request.getParameter("price")));
            product.setQty(Integer.parseInt(request.getParameter("qty")));

            boolean status = productDao.saveProduct(product);
            if (status) {
                modelMap.addAttribute("sm", "Product Saved Successfully");
            } else {
                modelMap.addAttribute("em", "Product not saved");
            }
        } catch (Exception e) {
            modelMap.addAttribute("em", "String can't convert into number");
        }

        return "redirect:/productpage";
    }

    @RequestMapping(value = "/editProduct/{id}", method = RequestMethod.GET)
    public String editProduct(@PathVariable("id") String id, ModelMap modelMap) {

        Product p = productDao.getProduct(Integer.parseInt(id));

        modelMap.addAttribute("product", p);
        modelMap.addAttribute("products", productDao.getAllProduct());

        return "productpage";

    }

    @RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
    public String updateProduct(ModelMap modelMap, HttpServletRequest request) {
        Product product = new Product();
        product.setPname(request.getParameter("pname"));
        try {
            product.setPid(Integer.parseInt(request.getParameter("pid")));
            product.setPrice(Double.parseDouble(request.getParameter("price")));
            product.setQty(Integer.parseInt(request.getParameter("qty")));

            boolean status = productDao.updateProduct(product);
            if (status) {
                modelMap.addAttribute("sm", "Product Update Successfully");
            } else {
                modelMap.addAttribute("em", "Product not update");
            }
        } catch (Exception e) {
            modelMap.addAttribute("em", "String can't convert into number");
        }

        return "redirect:/productpage";
    }

    @RequestMapping(value = "/deleteProduct/{id}", method = RequestMethod.GET)
    public String deletePorduct(@PathVariable("id") String id, ModelMap modelMap) {

        boolean status = productDao.deleteProduct(Integer.parseInt(id));
        if (status) {
            modelMap.addAttribute("sm", "Product deleted Successfully");
        } else {
            modelMap.addAttribute("em", "Product not delete");
        }
        
        return "redirect:/productpage";
    }

}
