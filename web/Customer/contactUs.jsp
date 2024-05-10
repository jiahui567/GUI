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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>

        <!-- Start Header/Navigation -->
        <%@include file="nav_bar.jsp" %>

        <!-- Start Hero Section -->
        <div class="hero">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-5">
                        <div class="intro-excerpt">
                            <h1>Contact</h1>
                            <p class="mb-4">Feel free to reach out to us with any questions, concerns, or inquiries you may have. Our dedicated team is here to assist you every step of the way.</p>
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


        <!-- Start Contact Form -->
        <div class="untree_co-section">
            <div class="container">

                <div class="block">
                    <div class="row justify-content-center">


                        <div class="col-md-8 col-lg-8 pb-4">


                            <div class="row mb-5">
                                <div class="col-lg-4">
                                    <div  class="service no-shadow align-items-center link horizontal d-flex active" data-aos="fade-left" data-aos-delay="0">
                                        <div class="service-icon color-1 mb-4">

                                            <svg xmlns="http://www.w3.org/2000/svg" width=50 height="50" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                            <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                                            </svg>
                                        </div> <!-- /.icon -->
                                        <div class="service-contents">
                                            <p>Jalan 2A,2A</p>
                                        </div> <!-- /.service-contents-->
                                    </div> <!-- /.service -->
                                </div>

                                <div class="col-lg-4">
                                    <div  class="service no-shadow align-items-center link horizontal d-flex active" data-aos="fade-left" data-aos-delay="0">
                                        <div class="service-icon color-1 mb-4">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                            <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"/>
                                            </svg>
                                        </div> <!-- /.icon -->
                                        <div class="service-contents">
                                            <p>han-KEA@gmail.com</p>
                                        </div> <!-- /.service-contents-->
                                    </div> <!-- /.service -->
                                </div>

                                <div class="col-lg-4">
                                    <div  class="service no-shadow align-items-center link horizontal d-flex active" data-aos="fade-left" data-aos-delay="0">
                                        <div class="service-icon color-1 mb-4">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-telephone-fill" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                                            </svg>
                                        </div> <!-- /.icon -->
                                        <div class="service-contents">
                                            <p>+0123456789</p>
                                        </div> <!-- /.service-contents-->
                                    </div> <!-- /.service -->
                                </div>
                            </div>
                            <h2 style="text-align:center; color:#55356E; font-weight: 800;">ANY QUERIES OR COMMENTS?</h2>
                            <form action="<%= request.getContextPath()%>/custFeedback" method="post" >
                                <% if (customer.getFullname() == null) {%>
                                <div class="form-group">
                                    <label class="text-black" for="fname">Your name</label>
                                    <input type="text" class="form-control" id="fname" name="fullname">
                                </div>
                                <div class="form-group">
                                    <label class="text-black" for="email">Email address</label>
                                    <input type="email" class="form-control" id="email" name="email">
                                </div>

                                <div class="form-group mb-5">
                                    <label class="text-black" for="message">Message</label>
                                    <textarea class="form-control" id="message" cols="30" rows="5" name="message"></textarea>
                                </div>

                                <button type="submit" class="btn btn-primary-hover-outline">Send Message</button>
                                <%} else {%>
                                <div class="form-group mb-5">
                                    <label class="text-black" for="message">Message</label>
                                    <textarea class="form-control" id="message" cols="30" rows="5" name="message"></textarea>
                                </div>

                                <div class="rating-box">
                                    <header>How was your experience?</header>
                                    <div class="stars">
                                        <i class="fa-solid fa-star star" data-rating="1"></i>
                                        <i class="fa-solid fa-star star" data-rating="2"></i>
                                        <i class="fa-solid fa-star star" data-rating="3"></i>
                                        <i class="fa-solid fa-star star" data-rating="4"></i>
                                        <i class="fa-solid fa-star star" data-rating="5"></i>
                                    </div>
                                </div>
                                <input type="hidden" name="rate" class="rate"></input>
                                <button type="submit" class="btn btn-primary-hover-outline">Send Message</button>
                                <%}%>
                            </form>

                        </div>

                    </div>

                </div>

            </div>


        </div>
    </div>

    <!-- End Contact Form -->



    <!-- Start Footer Section -->
    <%@include file="footer.jsp" %>
    <!-- End Footer Section -->	


    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/custom.js"></script>
    <script
        src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous">
    </script>
    <script>
        const stars = document.querySelectorAll(".stars i");
        // Loop through the "stars" NodeList
        stars.forEach((star, index1) => {
            // Add an event listener that runs a function when the "click" event is triggered
            star.addEventListener("click", () => {
                // Loop through the "stars" NodeList Again
                stars.forEach((star, index2) => {
                    // Add the "active" class to the clicked star and any stars with a lower index
                    // and remove the "active" class from any stars with a higher index
                    index1 >= index2 ? star.classList.add("active") : star.classList.remove("active");
                });
            });
        });

        $('.star').click(function () {
            let rate = $(this).attr("data-rating");
            $('.rate').val(rate);
        })
    </script>
</body>

</html>
<style>
    /*    .rating-box {
      position: relative;
      background: #fff;
      padding: 25px 50px 35px;
      border-radius: 25px;
      box-shadow: 0 5px 10px rgba(0, 0, 0, 0.05);
    }*/
    .rating-box header {
        font-size: 14px;
        color: #000000;
        font-weight: 500;
        margin-bottom: 15px;
    }
    .rating-box .stars {
        display: flex;
        align-items: center;
        gap: 10px;
        padding-bottom: 15px;
    }
    .stars i {
        color: #c0c0c0;
        font-size: 35px;
        cursor: pointer;
        transition: color 0.2s ease;
    }
    .stars i.active {
        color: #ff9c1a;
    }
</style>