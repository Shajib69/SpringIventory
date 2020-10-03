
package ac.dia.dao;

import ac.dia.entity.OrderDetails;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDetailsDao {
    private DataSource dataSource;
    private JdbcTemplate jdbcTemplate;

    public DataSource getDataSource() {
        return dataSource;
    }

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
    
    public boolean saveOrderDetails(OrderDetails od){
        String sql = "insert into orderdetails (orderId, pid, qty, price, subTotal) values (?, ?, ?, ?, ?)";
        int value = jdbcTemplate.update(sql, new Object[]{od.getOrderId(), od.getPid(), od.getQty(), od.getPrice(), od.getSubTotal()});
       
        
        if(value > 0){
            return true;
        }
        return false;
    }

    
    
}
