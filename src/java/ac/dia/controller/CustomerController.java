
package ac.dia.controller;

import ac.dia.dao.CustomerDao;
import ac.dia.dao.ProductDao;
import ac.dia.entity.Customer;
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
public class CustomerController {
    
    @Autowired
    private CustomerDao customerDao;

    @RequestMapping(value = "/customerpage", method = RequestMethod.GET)
    public String loadCustomerPage(ModelMap modelMap, HttpServletRequest request) {

        List<Customer> customers = customerDao.getAllCustomer();
        modelMap.addAttribute("customers", customers);

        modelMap.addAttribute("sm", request.getParameter("sm"));
        modelMap.addAttribute("em", request.getParameter("em"));

        return "customerpage";
    }

    @RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
    public String saveCustomer(ModelMap modelMap, HttpServletRequest request) {

        Customer customer = new Customer();
        customer.setCname(request.getParameter("cname"));
        customer.setPhone(request.getParameter("phone"));
        try {
            boolean status = customerDao.saveCustomer(customer);
            if (status) {
                modelMap.addAttribute("sm", "Customer Saved Successfully");
            } else {
                modelMap.addAttribute("em", "Customer not saved");
            }
        } catch (Exception e) {
            modelMap.addAttribute("em", "String can't convert into number");
        }

        return "redirect:/customerpage";
    }

    @RequestMapping(value = "/editCustomer/{id}", method = RequestMethod.GET)
    public String editCustomer(@PathVariable("id") String id, ModelMap modelMap) {

        Customer c = customerDao.getCustomer(Integer.parseInt(id));

        modelMap.addAttribute("customer", c);
        modelMap.addAttribute("customers", customerDao.getAllCustomer());

        return "customerpage";

    }

    @RequestMapping(value = "/updateCustomer", method = RequestMethod.POST)
    public String updateCustomer(ModelMap modelMap, HttpServletRequest request) {
        Customer customer = new Customer();
        customer.setCname(request.getParameter("cname"));
        customer.setPhone(request.getParameter("phone"));
        try {
            customer.setCid(Integer.parseInt(request.getParameter("cid")));

            boolean status = customerDao.updateCustomer(customer);
            if (status) {
                modelMap.addAttribute("sm", "Customer Update Successfully");
            } else {
                modelMap.addAttribute("em", "Customer not update");
            }
        } catch (Exception e) {
            modelMap.addAttribute("em", "String can't convert into number");
        }

        return "redirect:/customerpage";
    }

    @RequestMapping(value = "/deleteCustomer/{id}", method = RequestMethod.GET)
    public String deleteCustomer(@PathVariable("id") String id, ModelMap modelMap) {

        boolean status = customerDao.deleteCustomer(Integer.parseInt(id));
        if (status) {
            modelMap.addAttribute("sm", "Customer deleted Successfully");
        } else {
            modelMap.addAttribute("em", "Customer not delete");
        }
        
        return "redirect:/customerpage";
    }
    
}
