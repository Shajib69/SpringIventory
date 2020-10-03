package ac.dia.restcontroller;

import ac.dia.dao.OrderDao;
import ac.dia.entity.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/orders")
public class OrdersRestController {

    @Autowired
    private OrderDao dao;

    @RequestMapping(value = "/maxOrderNo", method = RequestMethod.GET)
    public String getOrderNo() {
        return dao.getOrderNo();
    }

    @RequestMapping(value = "/saveOrder", method = RequestMethod.POST, headers = "Accept=application/json")
    public Orders saveOrder(@RequestBody Orders orders) {
        System.out.println("-----------test---------"+orders);
        boolean status = dao.saveOrder(orders);
        if (status) {
            return orders;
        } else {
            return null;
        }

    }

}
