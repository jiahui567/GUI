<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Untree.co">
        <link rel="shortcut icon" href="favicon.png">

        <meta name="description" content="" />
        <meta name="keywords" content="bootstrap, bootstrap4" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bitter:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <title>HAN-KEA</title>
    </head>

    <body>

        <!-- Start Header/Navigation -->
        <%@include file="nav_bar.jsp" %>
        <!-- End Header/Navigation -->

        <!-- Start Hero Section -->
        <div class="hero">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-5">
                        <div class="intro-excerpt">
                            <h1>Services</h1>
                            <p class="mb-4">With a dedication to quality, professionalism, and customer satisfaction, our team of experts is committed to delivering outstanding results every time. </p>
                            <p><a href="<%= request.getContextPath()%>/ProductCRUD?action=get" class="btn btn-secondary me-2">Shop Now</a></p>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="hero-img-wrap">
                            <img src="images/couch.png" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Hero Section -->

        <!-- Start Why Choose Us Section -->
        <div class="why-choose-section">
            <div class="col-lg-5 mx-auto text-center">
                <h2 style="font-weight: 800; color:#55356E;" class="section-title">We Strive To Provide The Best Products And Services</h2>
            </div>
            <div class="container">
                <div class="row my-5">
                    <div class="col-6 col-md-6 col-lg-3 mb-4">
                        <div class="feature">
                            <div class="icon">
                                <img src="images/truck.svg" alt="Image" class="imf-fluid">
                            </div>
                            <h3>Fast &amp; Free Shipping</h3>
                            <p> Sit back and relax as your new appliances make their way to your doorstep in no time.</p>
                        </div>
                    </div>

                    <div class="col-6 col-md-6 col-lg-3 mb-4">
                        <div class="feature">
                            <div class="icon">
                                <img src="images/bag.svg" alt="Image" class="imf-fluid">
                            </div>
                            <h3>Easy to Shop</h3>
                            <p>Browse through our extensive selection, compare products, and make your purchase with just a few clicks. Finding the perfect appliance for your home has never been easier.</p>
                        </div>
                    </div>

                    <div class="col-6 col-md-6 col-lg-3 mb-4">
                        <div class="feature">
                            <div class="icon">
                                <img src="images/support.svg" alt="Image" class="imf-fluid">
                            </div>
                            <h3>24/7 Support</h3>
                            <p>Our dedicated support team is available round the clock to provide you with the help you need. </p>
                        </div>
                    </div>

                    <div class="col-6 col-md-6 col-lg-3 mb-4">
                        <div class="feature">
                            <div class="icon">
                                <img src="images/return.svg" alt="Image" class="imf-fluid">
                            </div>
                            <h3>Hassle Free Returns</h3>
                            <p>If you're not completely satisfied with your purchase, simply contact us, and we'll guide you through the return process with ease.</p>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!-- End Why Choose Us Section -->

        <!--         Start Product Section 
                <div class="product-section pt-0">
                    <div class="container">
                        <div class="row">
        
                             Start Column 1 
                            <div class="col-md-12 col-lg-3 mb-5 mb-lg-0">
                                <h2 class="mb-4 section-title">Crafted with excellent material.</h2>
                                <p class="mb-4">Each product in our collection is meticulously crafted with excellent materials, ensuring durability, reliability, and unmatched performance. </p>
                                <p><a href="product.jsp" class="btn">Explore</a></p>
                            </div> 
                             End Column 1 
        
                             Start Column 2 
                            <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                                <a class="product-item" href="#">
                                    <img src="images/product-1.png" class="img-fluid product-thumbnail">
                                    <h3 class="product-title">Nordic Chair</h3>
                                    <strong class="product-price">$50.00</strong>
        
                                    <span class="icon-cross">
                                        <img src="images/cross.svg" class="img-fluid">
                                    </span>
                                </a>
                            </div> 
                             End Column 2 
        
                             Start Column 3 
                            <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                                <a class="product-item" href="#">
                                    <img src="images/product-2.png" class="img-fluid product-thumbnail">
                                    <h3 class="product-title">Kruzo Aero Chair</h3>
                                    <strong class="product-price">$78.00</strong>
        
                                    <span class="icon-cross">
                                        <img src="images/cross.svg" class="img-fluid">
                                    </span>
                                </a>
                            </div>
                             End Column 3 
        
                             Start Column 4 
                            <div class="col-12 col-md-4 col-lg-3 mb-5 mb-md-0">
                                <a class="product-item" href="#">
                                    <img src="images/product-3.png" class="img-fluid product-thumbnail">
                                    <h3 class="product-title">Ergonomic Chair</h3>
                                    <strong class="product-price">$43.00</strong>
        
                                    <span class="icon-cross">
                                        <img src="images/cross.svg" class="img-fluid">
                                    </span>
                                </a>
                            </div>
                             End Column 4 
        
                        </div>
                    </div>
                </div>
                 End Product Section 
        
        
        
                 Start Testimonial Slider 
                <div class="testimonial-section before-footer-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-7 mx-auto text-center">
                                <h2 class="section-title">Testimonials</h2>
                            </div>
                        </div>
        
                        <div class="row justify-content-center">
                            <div class="col-lg-12">
                                <div class="testimonial-slider-wrap text-center">
        
                                    <div id="testimonial-nav">
                                        <span class="prev" data-controls="prev"><span class="fa fa-chevron-left"></span></span>
                                        <span class="next" data-controls="next"><span class="fa fa-chevron-right"></span></span>
                                    </div>
        
                                    <div class="testimonial-slider">
        
                                        <div class="item">
                                            <div class="row justify-content-center">
                                                <div class="col-lg-8 mx-auto">
        
                                                    <div class="testimonial-block text-center">
                                                        <blockquote class="mb-5">
                                                            <p>&ldquo;Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer convallis volutpat dui quis scelerisque.&rdquo;</p>
                                                        </blockquote>
        
                                                        <div class="author-info">
                                                            <div class="author-pic">
                                                                <img src="images/person-1.png" alt="Maria Jones" class="img-fluid">
                                                            </div>
                                                            <h3 class="font-weight-bold">Maria Jones</h3>
                                                            <span class="position d-block mb-3">CEO, Co-Founder, XYZ Inc.</span>
                                                        </div>
                                                    </div>
        
                                                </div>
                                            </div>
                                        </div> 
                                         END item 
        
                                        <div class="item">
                                            <div class="row justify-content-center">
                                                <div class="col-lg-8 mx-auto">
        
                                                    <div class="testimonial-block text-center">
                                                        <blockquote class="mb-5">
                                                            <p>&ldquo;Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer convallis volutpat dui quis scelerisque.&rdquo;</p>
                                                        </blockquote>
        
                                                        <div class="author-info">
                                                            <div class="author-pic">
                                                                <img src="images/person-1.png" alt="Maria Jones" class="img-fluid">
                                                            </div>
                                                            <h3 class="font-weight-bold">Maria Jones</h3>
                                                            <span class="position d-block mb-3">CEO, Co-Founder, XYZ Inc.</span>
                                                        </div>
                                                    </div>
        
                                                </div>
                                            </div>
                                        </div> 
                                         END item 
        
                                        <div class="item">
                                            <div class="row justify-content-center">
                                                <div class="col-lg-8 mx-auto">
        
                                                    <div class="testimonial-block text-center">
                                                        <blockquote class="mb-5">
                                                            <p>&ldquo;Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer convallis volutpat dui quis scelerisque.&rdquo;</p>
                                                        </blockquote>
        
                                                        <div class="author-info">
                                                            <div class="author-pic">
                                                                <img src="images/person-1.png" alt="Maria Jones" class="img-fluid">
                                                            </div>
                                                            <h3 class="font-weight-bold">Maria Jones</h3>
                                                            <span class="position d-block mb-3">CEO, Co-Founder, XYZ Inc.</span>
                                                        </div>
                                                    </div>
        
                                                </div>
                                            </div>
                                        </div> 
                                         END item 
        
                                    </div>
        
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 End Testimonial Slider -->



        <!-- Start Footer Section -->
        <%@include file="footer.jsp" %>
        <!-- End Footer Section -->	


        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>
