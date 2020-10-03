
package ac.dia.dao;

import ac.dia.entity.Orders;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao {
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
    
    
    
    public String getOrderNo() {
        String sql = "select max(orderId) from orders";
        String orderId = jdbcTemplate.queryForObject(sql, String.class);
        if (orderId == null) {
            orderId = "1";
        } else {
            orderId = String.valueOf(Integer.parseInt(orderId) + 1);
        }

        return orderId;
    }
    
    public boolean saveOrder(Orders orders){
        String sql = "insert into orders (cid, total, orderType, orderDate) values (?, ?, ?, ?)";
        int value = jdbcTemplate.update(sql, new Object[]{orders.getCid(), orders.getTotal(), orders.getOrderType(), orders.getOrderDate()});
        if(value > 0){
            return true;
        }
        return false;
    }

    
    
}
