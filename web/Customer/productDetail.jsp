<%@page import="java.util.*" %>
<%@page import="entity.*" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>HAN-KEA</title>

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrapOgani.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/styleOgani.css" type="text/css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bitter:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    </head>
    <%
        Products prod = (Products) session.getAttribute("prodDetail");
        List <ImageTable> img = (List) session.getAttribute("productId");
    %>
    <body>

        <%@include file="nav_bar.jsp" %>


        <!-- Product Details Section Begin -->
        <section class="product-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__pic">
                            <div class="product__details__pic__item">
                                <img class="product__details__pic__item--large"
                                     src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(prod.getImage())%>" alt="">
                            </div>

                            <div class="product__details__pic__slider owl-carousel">
                                <% 
                                     for (ImageTable imagetable : img){  
                                %>
                                <img data-imgbigurl="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(imagetable.getImage())%>"
                                     src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(imagetable.getImage())%>" alt="">
                                <%}%>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__text">
                            <h3><%= prod.getProductName()%></h3>
                            <div class="product__details__price">RM<%= prod.getPrice()%></div>
                            <form action="<%=request.getContextPath()%>/CartCRUD?function=add&user=<%=customer.getUserId()%>&product=<%=prod.getProductId()%>" method="post">
                                <div class="product__details__quantity">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input name="quantity" type="number" value="1">
                                        </div>
                                    </div>
                                </div>
                                <input type="submit" class="primary-btn" STYLE="color:#1f6924; background: #b3e9c7; "  value="ADD TO CART"></input>
                            </form>
                            <ul>
                                <li><b>Availability</b> <span><%= prod.getStockCount()%></span></li>
                                <li><b>Category</b> <span><%= prod.getCategoryId().getCatName()%></span></li>
                                <!--                            <li><b>Weight</b> <span>0.5 kg</span></li>
                                                            <li><b>Share on</b>
                                                                <div class="share">
                                                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                                                </div>
                                                            </li>-->
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <!--                        <ul class="nav nav-tabs" role="tablist">
                                                        <li class="nav-item">
                                                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                                                aria-selected="true">Description</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                                                aria-selected="false">Information</a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                                                aria-selected="false">Reviews <span>(1)</span></a>
                                                        </li>
                                                    </ul>-->
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <div class="product__details__tab__desc">
                                        <h6>Products Information</h6>
                                        <p><%= prod.getDescription()%></p>
                                    </div>
                                </div>
                                </section>
                                <%@include file="footer.jsp" %>


                                <!-- Js Plugins -->
                                <script src="js/jquery-3.3.1.min.js"></script>
                                <script src="js/bootstrap.min.js"></script>
                                <script src="js/jquery.nice-select.min.js"></script>
                                <script src="js/jquery-ui.min.js"></script>
                                <script src="js/jquery.slicknav.js"></script>
                                <script src="js/mixitup.min.js"></script>
                                <script src="js/owl.carousel.min.js"></script>
                                <script src="js/main.js"></script>


                                </body>

                                </html>