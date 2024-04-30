/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlTransient;

/**
 *
 * @author User
 */
@Entity
@Table(name = "PAYMENT_METHOD")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PaymentMethod.findAll", query = "SELECT p FROM PaymentMethod p"),
    @NamedQuery(name = "PaymentMethod.findByPaymentMethodid", query = "SELECT p FROM PaymentMethod p WHERE p.paymentMethodid = :paymentMethodid"),
    @NamedQuery(name = "PaymentMethod.findByMethodName", query = "SELECT p FROM PaymentMethod p WHERE p.methodName = :methodName")})
public class PaymentMethod implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PAYMENT_METHODID")
    private Integer paymentMethodid;
    @Column(name = "METHOD_NAME")
    private String methodName;
    @OneToMany(mappedBy = "paymentmethod")
    private List<Payment> paymentList;

    public PaymentMethod() {
    }

    public PaymentMethod(Integer paymentMethodid) {
        this.paymentMethodid = paymentMethodid;
    }

    public Integer getPaymentMethodid() {
        return paymentMethodid;
    }

    public void setPaymentMethodid(Integer paymentMethodid) {
        this.paymentMethodid = paymentMethodid;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    @XmlTransient
    public List<Payment> getPaymentList() {
        return paymentList;
    }

    public void setPaymentList(List<Payment> paymentList) {
        this.paymentList = paymentList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (paymentMethodid != null ? paymentMethodid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PaymentMethod)) {
            return false;
        }
        PaymentMethod other = (PaymentMethod) object;
        if ((this.paymentMethodid == null && other.paymentMethodid != null) || (this.paymentMethodid != null && !this.paymentMethodid.equals(other.paymentMethodid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entity.PaymentMethod[ paymentMethodid=" + paymentMethodid + " ]";
    }
    
}
