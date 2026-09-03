package hcmute.vn.entities;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "product")
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int productId;

    @Column(name = "product_name", nullable = false)
    private String productName;

    @Column(name = "price", nullable = false)
    private double price;

    @Column(name = "image")
    private String images;

    @Column(name = "description")
    private String description;

    @ManyToOne
    @JoinColumn(name = "cate_id")
    private Category category;

    public Product() {}

    public int getId() { return productId; }
    public void setId(int id) { this.productId = id; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getImage() { return images; }
    public void setImage(String image) { this.images = image; }

    public String getImages() { return images; }
    public void setImages(String images) { this.images = images; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }

    public String getCategoryName() {
        return (category != null) ? category.getCateName() : "";
    }

    public int getCategoryId() {
        return (category != null) ? category.getCateId() : 0;
    }

    public void setCategoryId(int cateId) {
        if (this.category == null) {
            this.category = new Category();
        }
        this.category.setCateId(cateId);
    }
}