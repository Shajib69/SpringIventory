/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.dia.restcontroller;

import ac.dia.dao.CustomerDao;
import ac.dia.entity.Customer;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/customers")
public class CustomerRestController {
    
    @Autowired
    private CustomerDao customerDao;
    
    @RequestMapping(
            value = "/allCustomer", 
            method = RequestMethod.GET, 
            headers = "Accept=application/json")
    public List<Customer> getAllCustomer(){
        return customerDao.getAllCustomer();
    }
    
}
