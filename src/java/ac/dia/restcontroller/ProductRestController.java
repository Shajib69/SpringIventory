package ac.dia.restcontroller;

import ac.dia.dao.ProductDao;
import ac.dia.entity.OrderDetails;
import ac.dia.entity.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/products")
public class ProductRestController {

    @Autowired
    private ProductDao productDao;
    
    @RequestMapping(
            value = "/allProduct", 
            method = RequestMethod.GET, 
            headers = "Accept=application/json")
    public List<Product> getAllProduct(){
        return productDao.getAllProduct();
    }
    
    
   @RequestMapping(value = "/saleProduct", method = RequestMethod.POST, headers = "Accept=application/json")
    public Product saleProduct(@RequestBody Product product) {
        boolean status = productDao.updateProductSele(product);
        if (status) {
            return product;
        } else {
            return null;
        }

    }
    
     @RequestMapping(value = "/purchaseProduct", method = RequestMethod.POST, headers = "Accept=application/json")
    public Product purchaseProduct(@RequestBody Product product) {
        boolean status = productDao.updateProductPurchase(product);
        if (status) {
            return product;
        } else {
            return null;
        }

    }
    
}
