/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.util.Date;
import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author User
 */
@Entity
@Table(name = "TRANSACTIONS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Transactions.findAll", query = "SELECT t FROM Transactions t"),
    @NamedQuery(name = "Transactions.findByTransactionId", query = "SELECT t FROM Transactions t WHERE t.transactionId = :transactionId"),
    @NamedQuery(name = "Transactions.findByTransactionType", query = "SELECT t FROM Transactions t WHERE t.transactionType = :transactionType"),
    @NamedQuery(name = "Transactions.findByDescription", query = "SELECT t FROM Transactions t WHERE t.description = :description"),
    @NamedQuery(name = "Transactions.findByTransDate", query = "SELECT t FROM Transactions t WHERE t.transDate = :transDate")})
public class Transactions implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "TRANSACTION_ID")
    private Integer transactionId;
    @Basic(optional = false)
    @Column(name = "TRANSACTION_TYPE")
    private String transactionType;
    @Column(name = "DESCRIPTION")
    private String description;
    @Basic(optional = false)
    @Column(name = "TRANS_DATE")
    @Temporal(TemporalType.DATE)
    private Date transDate;
    @JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID")
    @ManyToOne(optional = false)
    private Users userId;

    public Transactions() {
    }

    public Transactions(Integer transactionId) {
        this.transactionId = transactionId;
    }

    public Transactions(Integer transactionId, String transactionType, Date transDate) {
        this.transactionId = transactionId;
        this.transactionType = transactionType;
        this.transDate = transDate;
    }

    public Integer getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(Integer transactionId) {
        this.transactionId = transactionId;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getTransDate() {
        return transDate;
    }

    public void setTransDate(Date transDate) {
        this.transDate = transDate;
    }

    public Users getUserId() {
        return userId;
    }

    public void setUserId(Users userId) {
        this.userId = userId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (transactionId != null ? transactionId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Transactions)) {
            return false;
        }
        Transactions other = (Transactions) object;
        if ((this.transactionId == null && other.transactionId != null) || (this.transactionId != null && !this.transactionId.equals(other.transactionId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.Transactions[ transactionId=" + transactionId + " ]";
    }
    
}
