<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report</title>
    <!-- CSS -->
    <link rel="stylesheet" href="new.css">

      <!----===== Iconscout CSS ===== -->
      <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
      <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>
	  
<body>
    <%@include file="adminNavBar.jsp" %>

    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

            <div>
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search here...">
            </div>
            
            <!--<img src="images/profile.jpg" alt="">-->
        </div>
        <!-- <canvas id="layanan" width="50" height="50"></canvas> -->
        <canvas id="layanan_subbagian"  width=50% height=50%></canvas>
        

    </section>

</body>
</html>
<script>
//    $(function () {
//   var ctx_2 = document.getElementById('layanan_subbagian').getContext('2d');
//   var data_2 = {
//     datasets: [
//       {
//         data: [10, 10, 10],
//         backgroundColor: ['#3c8dbc', '#f56954', '#f39c12'],
//       },
//     ],
//     labels: ['Request', 'Layanan', 'Problem'],
//   };
//   var myDoughnutChart_2 = new Chart(ctx_2, {
//     type: 'bar',
//     data: data_2,
//     options: {
//       maintainAspectRatio: false,
//       legend: {
//         position: 'bottom',
//         labels: {
//           boxWidth: 4,
//         },
//       },
//     },
//   });
// });
$(function () {
  var ctx_2 = document.getElementById('layanan').getContext('2d');
  var data_2 = {
    datasets: [
      {
        data: [10, 10, 10],
        backgroundColor: ['#3c8dbc', '#f56954', '#f39c12'],
      },
    ],
    labels: ['Request', 'Layanan', 'Problem'],
  };
  var myDoughnutChart_2 = new Chart(ctx_2, {
    type: 'bar',
    data: data_2,
    options: {
      maintainAspectRatio: false,
      legend: {
        position: 'bottom',
        labels: {
          boxWidth: 4,
        },
      },
    },
  });
});

    const body = document.querySelector("body"),
      modeToggle = body.querySelector(".mode-toggle");
      sidebar = body.querySelector("nav");
      sidebarToggle = body.querySelector(".sidebar-toggle");

let getMode = localStorage.getItem("mode");
if(getMode && getMode ==="dark"){
    body.classList.toggle("dark");
}

let getStatus = localStorage.getItem("status");
if(getStatus && getStatus ==="close"){
    sidebar.classList.toggle("close");
}

modeToggle.addEventListener("click", () =>{
    body.classList.toggle("dark");
    if(body.classList.contains("dark")){
        localStorage.setItem("mode", "dark");
    }else{
        localStorage.setItem("mode", "light");
    }
});

sidebarToggle.addEventListener("click", () => {
    sidebar.classList.toggle("close");
    if(sidebar.classList.contains("close")){
        localStorage.setItem("status", "close");
    }else{
        localStorage.setItem("status", "open");
    }
})

   



  
</script>