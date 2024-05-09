<%@page import="java.util.*"%>
<%@page import="entity.*"%>
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
        <% List<Products> prodList = (List) session.getAttribute("sales");%>
        <section class="dashboard">
          
            <div class="top">
                <div class="option-role">
                    <form action="<%= request.getContextPath()%>/Filter?action=Report" method="post">
<!--                        <select name="Role" id="Role" onchange="this.form.submit()">
                            <option disabled selected>Filter</option>
                            <option value="0">Year</option>
                            <option value="1">Month</option>
                            <option value="2">Top Revenue</option>
                        </select>-->
                        <label>Select Start Date:</label>
                        <input type="date" name="date"></input>
                        <label>Select End Date:</label>
                        <input type="date" name="enddate"></input>
                        <input type="submit" value="submit"/>
                    </form>
                </div> 
            </div>          
            <table border-color="#CCC" class="staff-content" style="width:100%">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Sold(Quantity)</th>
                    <th>Revenue</th>
                </tr>
                <% for (Products prod : prodList) {%>
                <tr>
                    <td><%= prod.getProductId()%></td>   
                    <td><%= prod.getProductName()%></td>
                    <td><%= prod.getStockCount()%></td>
                    <td><%= prod.getPrice()%></td>
                </tr>
                <%}%>
            </table>

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
    if (getMode && getMode === "dark") {
        body.classList.toggle("dark");
    }

    let getStatus = localStorage.getItem("status");
    if (getStatus && getStatus === "close") {
        sidebar.classList.toggle("close");
    }

    modeToggle.addEventListener("click", () => {
        body.classList.toggle("dark");
        if (body.classList.contains("dark")) {
            localStorage.setItem("mode", "dark");
        } else {
            localStorage.setItem("mode", "light");
        }
    });

    sidebarToggle.addEventListener("click", () => {
        sidebar.classList.toggle("close");
        if (sidebar.classList.contains("close")) {
            localStorage.setItem("status", "close");
        } else {
            localStorage.setItem("status", "open");
        }
    })






</script>