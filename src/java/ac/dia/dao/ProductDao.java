package ac.dia.dao;

import ac.dia.entity.Product;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {

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

    public List<Product> getAllProduct() {
        String sql = "select * from product";
        return jdbcTemplate.query(sql, new ProductMapper());
    }

    public Product getProduct(int id) {
        String sql = "select * from product where pid = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new ProductMapper());
    }

    public static class ProductMapper implements RowMapper<Product> {

        @Override
        public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
            Product p = new Product();
            p.setPid(rs.getInt("pid"));
            p.setPname(rs.getString("pname"));
            p.setPrice(rs.getDouble("price"));
            p.setQty(rs.getInt("qty"));
            return p;
        }

    }

    public boolean saveProduct(Product product) {
        String sql = "insert into product (pname, price, qty) values (?, ?, ?)";
        int value = jdbcTemplate.update(sql, new Object[]{product.getPname(), product.getPrice(), product.getQty()});
        if (value > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean updateProduct(Product product) {
        String sql = "update product set pname=?, price=?, qty=? where pid=?";
        int value = jdbcTemplate.update(sql, new Object[]{product.getPname(), product.getPrice(), product.getQty(), product.getPid()});
        if (value > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean deleteProduct(int id) {
        String sql = "delete from product where pid=?";
        int value = jdbcTemplate.update(sql, new Object[]{id});
        if (value > 0) {
            return true;
        } else {
            return false;
        }
    }
    
    
    public boolean updateProductSele(Product product) {
        String sql = "update product set  qty=qty-? where pid=?";
        int value = jdbcTemplate.update(sql, new Object[]{product.getQty(), product.getPid()});
        if (value > 0) {
            return true;
        } else {
            return false;
        }
    }
    public boolean updateProductPurchase(Product product) {
        String sql = "update product set  qty=qty+? where pid=?";
        int value = jdbcTemplate.update(sql, new Object[]{product.getQty(), product.getPid()});
        if (value > 0) {
            return true;
        } else {
            return false;
        }
    }
    

}
