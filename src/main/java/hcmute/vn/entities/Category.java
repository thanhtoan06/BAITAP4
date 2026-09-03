package hcmute.vn.entities;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.*;

@Entity
@Table(name = "category")
@NamedQuery(name = "Category.findAll", query = "SELECT c FROM Category c")
public class Category implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cate_id")
    private int cateId;

    @Column(name = "cate_name", nullable = false)
    private String cateName;

    @Column(name = "icons")
    private String icons;

    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
    private List<Product> products;

    public Category() {}

    public Category(int cateId, String cateName, String icons) {
        this.cateId = cateId;
        this.cateName = cateName;
        this.icons = icons;
    }

    public int getCateId() { return cateId; }
    public void setCateId(int cateId) { this.cateId = cateId; }

    public String getCateName() { return cateName; }
    public void setCateName(String cateName) { this.cateName = cateName; }

    public String getIcons() { return icons; }
    public void setIcons(String icons) { this.icons = icons; }

    public List<Product> getProducts() { return products; }
    public void setProducts(List<Product> products) { this.products = products; }
}