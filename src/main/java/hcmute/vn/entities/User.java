package hcmute.vn.entities;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "user")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "username", nullable = false, unique = true)
    private String username;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "fullname", nullable = false)
    private String fullname;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "phone")
    private String phone;

    @Column(name = "avatar")
    private String avatar = "admin.png";

    @Column(name = "roleid", nullable = false)
    private int roleid = 1;

    @Temporal(TemporalType.DATE)
    @Column(name = "createddate")
    private Date createddate;

    @Column(name = "status")
    private int status = 0;

    @Column(name = "code")
    private String code;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "code_expired")
    private Date codeExpired;

    public User() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAvatar() { return avatar; }
    public void setAvatar(String avatar) { this.avatar = avatar; }

    public Date getCreateddate() { return createddate; }
    public void setCreateddate(Date createddate) { this.createddate = createddate; }

    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public Date getCodeExpired() { return codeExpired; }
    public void setCodeExpired(Date codeExpired) { this.codeExpired = codeExpired; }

    public int getRoleid() { return roleid; }
    public void setRoleid(int roleid) { this.roleid = roleid; }

    public int getRoleId() { return roleid; }
    public void setRoleId(int roleId) { this.roleid = roleId; }

    public int getRole() { return roleid; }
    public void setRole(int role) { this.roleid = role; }
}