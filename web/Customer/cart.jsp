<%@page import="java.util.*" %>
<%@page import="entity.*" %>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Untree.co">
        <link rel="shortcut icon" href="favicon.png">

        <meta name="description" content="" />
        <meta name="keywords" content="bootstrap, bootstrap4" />

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bitter:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    </head>

    <body>

        <!-- Start Header/Navigation -->
        <%@include file="nav_bar.jsp"%>
        <% List<CartItem> cartList = (List)session.getAttribute("cart");%>
        <!-- End Header/Navigation -->

        <!-- Start Hero Section -->
        <div class="hero">
            <div class="container">
                <a href="cart.jsp"></a>
                <div class="row justify-content-between">
                    <div class="col-lg-5">
                        <div class="intro-excerpt">
                            <h1>Cart</h1>
                        </div>
                    </div>
                    <div class="col-lg-7">

                    </div>
                </div>
            </div>
        </div>
        <!-- End Hero Section -->



        <div class="untree_co-section before-footer-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="site-blocks-table">
                        <table class="table" id="start">
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">Image</th>
                                    <th class="product-name">Product</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-total">Total</th>
                                    <th class="product-remove">Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% double subtotal = 0;%>
                                <% double totalamount = 0;%>

                                <% 
                                  for (CartItem cartItem : cartList){
                                      Products prod = cartItem.getProductid();
                              
                                %>
                            <form class="col-md-12" action="<%=request.getContextPath()%>/CartCRUD?function=editQuantity&action=update&cartItem=<%=cartItem.getCartItemid()%>" method="post">
                                <tr>
                                    <td>
                                        <img width="100%" height="100%" src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(prod.getImage())%>">
                                    </td>
                                    <td class="product-name">
                                        <h2 class="h5 text-black"><%= prod.getProductName()%></h2>
                                    </td>
                                    <td>$<%= prod.getPrice()%></td>
                                    <td>
                                        <div class="input-group mb-3 d-flex align-items-center quantity-container" style="max-width: 120px;">
                                            <div class="input-group-prepend">
                                                <button class="btn btn-outline-black decrease" type="button"><a href="<%=request.getContextPath()%>/CartCRUD?function=editQuantity&action=minus&cartItem=<%=cartItem.getCartItemid()%>" style="text-decoration:none">&minus;</a></button>
                                            </div>
                                            <input type="number" name="qty" class="form-control text-center quantity-amount" value="<%= cartItem.getQuantity()%>" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1" >
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-black increase" type="button"><a href="<%=request.getContextPath()%>/CartCRUD?function=editQuantity&action=inc&cartItem=<%=cartItem.getCartItemid()%>" style="text-decoration:none">&plus;</a></button>
                                            </div>
                                        </div>
                                        <% double total = prod.getPrice() * cartItem.getQuantity();%>
                                        <% subtotal += total;%>

                                    <td><%=total%></td>
                                    <td>
                                        <a href="<%= request.getContextPath()%>/CartCRUD?function=delete&id=<%=cartItem.getCartItemid()%>" class="btn btn-black btn-sm">X</a></td>
                                    </td>
                                </tr>
                                <%}%>
                                <% double shippingfee = 25.0;%>
                                <% if(subtotal < 1000){
                                        totalamount = subtotal + shippingfee;
                                    }else{
                                        totalamount = subtotal;
                                    }
                                %>
                                <!--                        <tr>
                                                          <td class="product-thumbnail">
                                                            <img src="images/product-1.png" alt="Image" class="img-fluid">
                                                          </td>
                                                          <td class="product-name">
                                                            <h2 class="h5 text-black">Product 1</h2>
                                                          </td>
                                                          <td>$49.00</td>
                                                          <td>
                                                            <div class="input-group mb-3 d-flex align-items-center quantity-container" style="max-width: 120px;">
                                                              <div class="input-group-prepend">
                                                                <button class="btn btn-outline-black decrease" type="button">&minus;</button>
                                                              </div>
                                                              <input type="text" class="form-control text-center quantity-amount" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                                              <div class="input-group-append">
                                                                <button class="btn btn-outline-black increase" type="button">&plus;</button>
                                                              </div>
                                                            </div>
                                        
                                                          </td>
                                                          <td>$49.00</td>
                                                          <td><a href="#" class="btn btn-black btn-sm">X</a></td>
                                                        </tr>
                                        
                                                        <tr>
                                                          <td class="product-thumbnail">
                                                            <img src="images/product-2.png" alt="Image" class="img-fluid">
                                                          </td>
                                                          <td class="product-name">
                                                            <h2 class="h5 text-black">Product 2</h2>
                                                          </td>
                                                          <td>$49.00</td>
                                                          <td>
                                                            <div class="input-group mb-3 d-flex align-items-center quantity-container" style="max-width: 120px;">
                                                              <div class="input-group-prepend">
                                                                <button class="btn btn-outline-black decrease" type="button">&minus;</button>
                                                              </div>
                                                              <input type="text" class="form-control text-center quantity-amount" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                                                              <div class="input-group-append">
                                                                <button class="btn btn-outline-black increase" type="button">&plus;</button>
                                                              </div>
                                                            </div>
                                        
                                                          </td>
                                                          <td>$49.00</td>
                                                          <td><a href="#" class="btn btn-black btn-sm">X</a></td>
                                                        </tr>-->
                            </form>

                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="row mb-5">
                            <!--                    <div class="col-md-6 mb-3 mb-md-0">
                                                  <button class="btn btn-black btn-sm btn-block">Update Cart</button>
                                                </div>-->
                            <div class="col-md-6">
                                <a style="color:white;text-decoration: none" href="<%=request.getContextPath()%>/ProductCRUD?action=get"><button class="btn btn-outline-black btn-sm btn-block">Continue Shopping</button></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label class="text-black h4" for="coupon">Coupon</label>
                                <p>Enter your coupon code if you have one.</p>
                            </div>
                            <div class="col-md-8 mb-3 mb-md-0">
                                <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
                            </div>
                            <div class="col-md-4">
                                <button class="btn btn-black">Apply Coupon</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 pl-5">
                        <div class="row justify-content-end">
                            <div class="col-md-7">
                                <div class="row">
                                    <div class="col-md-12 text-right border-bottom mb-5">
                                        <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span class="text-black">Subtotal</span>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <strong class="text-black"><%=subtotal%></strong>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span class="text-black">Shipping Fees</span>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <% if (subtotal < 1000){%>
                                        <strong class="text-black">+$25.0</strong>
                                        <%} else {%>
                                        <strong class="text-black">Free</strong>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="row mb-5">
                                    <div class="col-md-6">
                                        <span class="text-black">Total</span>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <strong class="text-black"><%=totalamount%></strong>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                         <%if(!cartList.isEmpty()){%>
                                         <button class="btn btn-black btn-lg py-3 btn-block" > <a style="text-decoration: none; color: #ffffff;" href="<%= request.getContextPath()%>/Checkout?Id=<%= customer.getUserId()%>">Proceed To Checkout </a></button>
                                        <%}else{%>
                                        <button class="btn btn-black btn-lg py-3 btn-block" > <a style="text-decoration: none; color: #ffffff;" >Proceed To Checkout </a></button>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Start Footer Section -->
        <%@include file="footer.jsp"%>
        <!-- End Footer Section -->	


        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous">
        </script>
        <!--                <script>
                            $(".decrease").on("click",async function(){
                                let id = $(this).attr("data-id");
                                console.log(id);
                                let quantity = $(".quantity-amount-"+id).val();
                                quantity--;
                                console.log(quantity);
                                let data = {'quantity' : quantity};
                                try{
                                    const response = await fetch("<%=request.getContextPath()%>/quantityCart",{
                                        method:"POST",
                                        headers:{
                                            "Content-Type":"application/json",
                                        },
                                        body:JSON.stringify(data),
                                    });
                                    const result = await response.json();
                                    console.log("success",result);
                                }catch(error){
                                    console.log("ERROR",error);
                                }
                            });
                        </script>-->
    </body>

</html>
<script>
    function SubmitForm() {
        var oForm = document.getElementById("qtyform");
        oForm.submit();
    }


</script>
