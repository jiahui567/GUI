<!-- <%-- 
    Document   : paypay
    Created on : 30 Apr 2024, 10:49:55 pm
    Author     : Ong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<jsp:useBean id="customer" scope="session" class="entity.Users"/> 
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

            <div class="mb-4">

                <h2>Confirm order and pay</h2>
                <span>Please make the payment and you can enjoy all the features and benefits.</span>

            </div>

            <div class="row">

                <div class="col-md-8">


                    <div class="card p-3">
                        <form action="" method="post">
                            <h6 class="text-uppercase">Payment details</h6>
                            <div class="inputbox mt-3">
                                <input type="text" name="name" class="form-control" required="required"> 
                                <span>Name on card</span> 
                            </div>


                            <div class="row">

                                <div class="col-md-6">

                                    <div class="inputbox mt-3 mr-2">
                                        <input type="tel" name="card_number" id="cardNumber" inputmode="numeric"
                                               pattern="[0-9]{4}[ ][0-9]{4}[ ][0-9]{4}[ ][0-9]{4}" maxlength="19"
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
                                            <input type="number" max="999" onKeyPress="if (this.value.length == 3)
                                                        return false;" name="name" class="form-control" required="required"> 
                                            <span>CVV</span> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--                            <div class="mt-4 mb-4">
                                                            <h6 class="text-uppercase">Billing Address</h6>
                                                            <div class="row mt-3">
                                                                <div class="col-md-6">
                                                                    <div class="inputbox mt-3 mr-2"> <input type="text" name="name" class="form-control" required="required"> 
                                                                        <span>Street Address</span> 
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <span>City</span>
                                                                    <div class="inputbox mt-3 mr-2"> 
                                                                        <select name="city" id="city">
                                                                            <option value="kl">Kuala Lumpur</option>
                                                                            <option value="kajang">Kajang</option>
                                                                            <option value="pj">Petaling Jaya</option>
                                                                            <option value="klang">Klang</option>
                                                                            <option value="jb">Johor Bahru</option>
                                                                            <option value="shahalam">Shah Alam</option>
                                                                            <option value="gerogetown">George Town</option>
                                                                            <option value="sandakan">Sandakan</option>
                                                                            <option value="melaka">Malacca City</option>
                                                                            <option value="alorsetar">Alor Setar</option>
                                                                            <option value="batupahat">Batu Pahat</option>
                                                                            <option value="padawan">Padawan</option>
                                                                            <option value="kulai">Kulai</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-2">
                                                                <div class="col-md-6">
                                                                    <div class="inputbox mt-3 mr-2">
                                                                        <input type="number" pattern="/^-?\d+\.?\d*$/"
                                                                               onKeyPress="if (this.value.length == 5)
                                                                                           return false;" name="name"
                                                                               class="form-control" required="required">
                                                                        <span>Zip code</span>
                                                                    </div>
                                                                </div>
                            
                                                                <div class="col-md-6">
                                                                    <span>State/Province</span>
                                                                    <select name="state" id="state">
                                                                        <option name="negerisembilan" id="">Negeri Sembilan</option>
                                                                        <option name="perak" id="">Perak</option>
                                                                        <option name="kedah" id="">Kedah</option>
                                                                        <option name="kelantan" id="">Kelantan</option>
                                                                        <option name="sarawak" id="">Sarawak</option>
                                                                        <option name="selangor" id="">Selangor</option>
                                                                        <option name="pahang" id="">Pahang</option>
                                                                        <option name="terengganu" id="">Terengganu</option>
                                                                        <option name="sabah" id="">Sabah</option>
                                                                        <option name="johor" id="">Johor</option>
                                                                        <option name="perlis" id="">Perlis</option>
                                                                        <option name="penang" id="">Penang</option>
                                                                        <option name="melaka" id="">Melaka</option>
                                                                    </select>
                                                                    <div class="row mt-2 ">
                                                                        <div class="mt-4 mb-4 d-flex justify-content-between">
                                                                            <button class="btn btn-success px-3">Pay</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>-->
                            <div class="mt-4 mb-4">
                                <h6 class="text-uppercase">Billing Address</h6>
                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <div class="inputbox mt-3 mr-2"> 
                                            <a>Address</a> 
                                            <input type="text" disabled name="address" id="address" value="<%= customer.getAddress()%>">
                                            
                                        </div>
                                    </div>
                                    <div class="row mt-2 ">
                                            <div class="mt-4 mb-4 d-flex justify-content-between">
                                                <button class="btn btn-success px-3">Pay</button>
                                                 <button class="btn btn-back px-3" ><a href="cart.jsp">Back</a></button>
                                                
                                            </div>
                                           
                                        </div>
                                </div>
                            </div>
                    </div>
                </div>
                </form>
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
    a {
    color: #ffffff;
    text-decoration: none;
    background-color: transparent;
    -webkit-text-decoration-skip: objects;
}
</style>


<script>
    function formatCardNumber(input) {
        const value = input.value.trim();
        const formattedValue = value.replace(/\d{4}(?=\d)/g, '$& ').trim();
        input.value = formattedValue;
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


</script>