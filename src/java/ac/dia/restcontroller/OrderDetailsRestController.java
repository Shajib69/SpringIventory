
package ac.dia.restcontroller;

import ac.dia.dao.OrderDao;
import ac.dia.dao.OrderDetailsDao;
import ac.dia.entity.OrderDetails;
import ac.dia.entity.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/orderDetails")
public class OrderDetailsRestController {
    
    @Autowired
    private OrderDetailsDao dao;
    
    @RequestMapping(value = "/saveOrderDetails", method = RequestMethod.POST, headers = "Accept=application/json")
    public OrderDetails saveOrderDetails(@RequestBody OrderDetails od) {
        boolean status = dao.saveOrderDetails(od);
        if (status) {
            return od;
        } else {
            return null;
        }

    }
    
    
    
    
}
