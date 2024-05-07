<%@page import="java.util.*" %>
<%@page import="entity.*" %>
<%@page import="java.text.DecimalFormat" %>
<!-- <%-- 
    Document   : paypay
    Created on : 30 Apr 2024, 10:49:55 pm
    Author     : Ong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<jsp:useBean id="customer" scope="session" class="entity.Users"/> 
<% List<CartItem> cartList = (List)request.getAttribute("cart");%>
<html>

    <head>
        <title>Payment</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/style.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/inputmask/5.0.6/jquery.inputmask.min.js"></script>

    </head>

    <body>

        <div class="container mt-5 px-5">
            <div class="row" style="margin-top: 10px;">

                <div class="col-md-8">


                    <div class="card p-3">
                        <h1>Receipt</h1>
                        <h3>Product</h3>
                        <% double totalamount = 0;%>
                        <% for(CartItem item:cartList){%>
                        <p style="text-align:left;">
                            <%=item.getProductid().getProductName()%> x <%=item.getQuantity()%>
                            <span style="float:right;">
                                <%=item.getProductid().getPrice() * item.getQuantity()%>
                                <% totalamount += item.getProductid().getPrice() * item.getQuantity();%>
                            </span>
                        </p>
                        <%}%>
                        <hr>
                        <p style="text-align:left;">
                            Delivery Fee
                            <span style="float:right;">
                                <%if(totalamount > 1000){%>
                                Free
                                <%}else{
                                totalamount +=25; %>
                                25
                                <%}%>
                            </span>
                        </p>
                        <p style="text-align:left;">
                            SST
                            <span style="float:right;">
                                <%  DecimalFormat priceFormatter = new DecimalFormat("#0.00");%>
                                <%=priceFormatter.format((totalamount / 100) * 6)%>
                                <%totalamount += Double.parseDouble(priceFormatter.format((totalamount / 100) * 6));%>
                            </span>
                        </p>
                        <hr>
                        <p style="text-align:left;">
                            Total Amount
                            <span style="float:right;">
                                <%=totalamount%>
                            </span>
                        </p>
                    </div>
                </div>

            </div>
            <div class="mb-4">

                <h2>Confirm order and pay</h2>
                <span>Please make the payment and you can enjoy all the features and benefits.</span>

            </div>
            <p>Switch to:
                <button id="switchMethod" onclick="switchMethod(this)">Cash On Delivery</button>
            </p>
            <div class="row" id="cardForm">

                <div class="col-md-8">
                    <div class="card p-3">
                        <form action="<%=request.getContextPath()%>/Payments?cartId=<%=cartList.get(0).getCartId().getCartId()%>" method="post">
                            <h6 class="text-uppercase">Payment details<span style="float:right;"><img id="cardType" src="<%=request.getContextPath()%>/Customer/images/visa.png" width="50" height="50" style="display:none;"/></span></h6>
                            <input id="paymentMethod" name="paymentMethod" type="text" value="" hidden>
                            <input type="text" name="totalAmount" value="<%=totalamount%>" hidden>
                            <div class="inputbox mt-3">
                                <input type="text" name="name" class="form-control" required="required"> 
                                <span>Name on card</span> 
                            </div>

                            <div class="row">

                                <div class="col-md-6">

                                    <div class="inputbox mt-3 mr-2">
                                        <input type="tel" name="card_number" id="cardNumber" inputmode="numeric"
                                               pattern="[2,4,5]{1}[0-9]{3}[ ][0-9]{4}[ ][0-9]{4}[ ][0-9]{4}" maxlength="19"
                                               class="form-control" oninput="formatCardNumber(this)" required="required">
                                        <span>Card Number</span>
                                    </div>


                                </div>

                                <div class="col-md-6">

                                    <div class="d-flex flex-row">

                                        <div class="inputbox mt-3 mr-2">
                                            <input type="text" id="expiry-date" name="expiry-date" class="form-control" required="required" maxlength=" 5">
                                            <span>Expiry</span>
                                        </div>


                                        <div class="inputbox mt-3 mr-2"> 
                                            <input type="number" onKeyPress="if (this.value.length == 3)
                                                        return false;" name="name" class="form-control" required="required"> 
                                            <span>CVV</span> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-4 mb-4">
                                <h6 class="text-uppercase">Billing Address</h6>
                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <div class="inputbox mt-3 mr-2"> 
                                            <a>Address</a> 
                                            <input type="text" name="address" value="<%= customer.getAddress()%>" readonly="readonly">
                                            <p>*Address get from profile address</p>
                                        </div>
                                    </div>
                                    <div class="row mt-2 ">
                                        <div class="mt-4 mb-4 d-flex justify-content-between">
                                            <input type="submit" class="btn btn-success px-3" value="Pay">
                                            <button class="btn btn-back px-3" ><a href="cart.jsp">Back</a></button>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>

            <div class="row" id="cashForm" style="display:none;">

                <div class="col-md-8">
                    <div class="card p-3">
                        <div class="mt-4 mb-4">
                            <form action="<%=request.getContextPath()%>/Payments?cartId=<%=cartList.get(0).getCartId().getCartId()%>" method="post">
                                <input name="paymentMethod" type="text" value="3" hidden>
                                <input type="text" name="totalAmount" value="<%=totalamount%>" hidden>
                                <h6 class="text-uppercase">Billing Address</h6>
                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <div class="inputbox mt-3 mr-2"> 
                                            <a>Address</a> 
                                            <input type="text" name="address" value="<%= customer.getAddress()%>" readonly="readonly">
                                            <p>*Address get from profile address</p>
                                        </div>
                                    </div>
                                    <div class="row mt-2 ">
                                        <div class="mt-4 mb-4 d-flex justify-content-between">
                                            <input type="submit" class="btn btn-success px-3" value="Pay">
                                            <button class="btn btn-back px-3" ><a href="cart.jsp">Back</a></button>
                                        </div>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>  


        </div>
    </div>
</body>
</html>



<style>
    body {

        background-color: #eee;
    }

    .container {

        height: 100vh;

    }


    .card {
        border: none;
    }

    .form-control {
        border-bottom: 2px solid #eee !important;
        border: none;
        font-weight: 600
    }

    .form-control:focus {
        color: #495057;
        background-color: #fff;
        border-color: #8bbafe;
        outline: 0;
        box-shadow: none;
        border-radius: 0px;
        border-bottom: 2px solid blue !important;
    }



    .inputbox {
        position: relative;
        margin-bottom: 20px;
        width: 100%
    }

    .inputbox span {
        position: absolute;
        top: 7px;
        left: 11px;
        transition: 0.5s
    }

    .inputbox i {
        position: absolute;
        top: 13px;
        right: 8px;
        transition: 0.5s;
        color: #3F51B5
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0
    }

    .inputbox input:focus~span {
        transform: translateX(-0px) translateY(-15px);
        font-size: 12px
    }

    .inputbox input:valid~span {
        transform: translateX(-0px) translateY(-15px);
        font-size: 12px
    }

    .card-blue {

        background-color: #492bc4;
    }

    .hightlight {

        background-color: #5737d9;
        padding: 10px;
        border-radius: 10px;
        margin-top: 15px;
        font-size: 14px;
    }

    .yellow {

        color: #fdcc49;
    }

    .decoration {

        text-decoration: none;
        font-size: 14px;
    }

    .btn-success {
        font-weight: 600;
        padding: 12px 30px;
        border-radius: 30px;
        color: #ffffff;
        background: #2f2f2f;
        border-color: #2f2f2f;
    }

    .btn-success:hover {
        font-weight: 600;
        padding: 12px 30px;
        border-radius: 30px;
        color: #ffffff;
        background: #2f2f2f;
        border-color: #2f2f2f;

    }

    .btn-back{
        font-weight: 600;
        padding: 12px 30px;
        border-radius: 30px;
        color: #ffffff;
        background: #2f2f2f;
        border-color: #2f2f2f;
        margin-left: 20px;
    }
    .btn-back:focus{
        font-weight: 600;
        padding: 12px 30px;
        border-radius: 30px;
        font-color: #ffffff;
        background: #2f2f2f;
        border-color: #2f2f2f;
    }
    .btn-back:hover {
        font-weight: 600;
        padding: 12px 30px;
        border-radius: 30px;
        color: #ffffff;
        background: #2f2f2f;
        border-color: #2f2f2f;
    }
    .decoration:hover {

        text-decoration: none;
        color: #fdcc49;
    }
    a{
        color: #ffffff;
        text-decoration: none;
        background-color: transparent;
        -webkit-text-decoration-skip: objects;
    }
    a:hover{
        color: #ffffff;
        text-decoration: none;
        background-color: transparent;
        -webkit-text-decoration-skip: objects;
    }
    hr {
        margin: 0;
    }
</style>


<script>
    function formatCardNumber(input) {
        const image = document.getElementById("cardType");
        const value = input.value.trim();
        const formattedValue = value.replace(/\d{4}(?=\d)/g, '$& ').trim();
        const method = document.getElementById("paymentMethod");
        input.value = formattedValue;
        if (input.value.charAt(0) == "4") {
            image.style.display = "block";
            image.src = "<%=request.getContextPath()%>/Customer/images/visa.png";
            method.value = "1";
        } else if (input.value.charAt(0) == "5" || input.value.charAt(0) == "2") {
            image.style.display = "block";
            image.src = "<%=request.getContextPath()%>/Customer/images/mastercard.png";
            method.value = "2";
        } else {
            image.style.display = "none";
            method.value = "";
        }
    }
    document.addEventListener('DOMContentLoaded', function () {
        var expiryDateInput = document.getElementById('expiry-date');

        expiryDateInput.addEventListener('input', function () {
            var value = expiryDateInput.value;

            // Only add slash after two characters if the length is 2 and the last character is a number
            if (value.length === 2 && !isNaN(value.charAt(1))) {
                expiryDateInput.value = value + '/';
            }
        });
     });

    function switchMethod(btn) {
        const cardForm = document.getElementById("cardForm");
        const cashForm = document.getElementById("cashForm");
        if (btn.innerHTML == "Credit/Debit") {
            cardForm.style.display = "block";
            cashForm.style.display = "none";
            btn.innerHTML = "Cash On Delivery";
        } else {
            cardForm.style.display = "none";
            cashForm.style.display = "block";
            btn.innerHTML = "Credit/Debit";
        }
    }
</script>
