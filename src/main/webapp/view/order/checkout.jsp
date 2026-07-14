<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<html>

<head>

    <title>Thanh toán</title>

</head>

<body>

<c:import url="../component/header.jsp"/>
<c:import url="../component/navbar.jsp"/>

<div class="container mt-4">

    <h2 class="mb-4">

        Xác nhận đơn hàng

    </h2>

    <div class="row">

        <!-- Thông tin người nhận -->

        <div class="col-md-7">

            <div class="card">

                <div class="card-header bg-primary text-white">

                    Thông tin giao hàng

                </div>

                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/checkout"
                          method="post">

                        <div class="mb-3">

                            <label class="form-label">

                                Người nhận

                            </label>

                            <input type="text"
                                   class="form-control"
                                   name="receiverName"
                                   value="${sessionScope.user.fullName}">

                            <small class="text-danger">

                                ${receiverNameError}

                            </small>

                        </div>

                        <div class="mb-3">

                            <label class="form-label">

                                Số điện thoại

                            </label>

                            <input type="text"
                                   class="form-control"
                                   name="phone"
                                   value="${sessionScope.user.phone}">

                            <small class="text-danger">

                                ${phoneError}

                            </small>

                        </div>

                        <div class="mb-3">

                            <label class="form-label">

                                Địa chỉ

                            </label>

                            <textarea class="form-control"
                                      rows="3"
                                      name="address">${address}</textarea>

                            <small class="text-danger">

                                ${addressError}

                            </small>

                        </div>

                        <div class="mb-3">

                            <label class="form-label">

                                Ghi chú

                            </label>

                            <textarea class="form-control"
                                      rows="3"
                                      name="note">${note}</textarea>

                        </div>

                        <div class="mb-3">

                            <label class="form-label fw-bold">
                                Phương thức thanh toán
                            </label>

                            <div class="form-check">

                                <input class="form-check-input"
                                       type="radio"
                                       name="paymentMethod"
                                       value="COD"
                                       checked
                                       onclick="toggleQR()">

                                <label class="form-check-label">
                                    Thanh toán khi nhận hàng (COD)
                                </label>

                            </div>

                            <div class="form-check">

                                <input class="form-check-input"
                                       type="radio"
                                       name="paymentMethod"
                                       value="BANK"
                                       onclick="toggleQR()">

                                <label class="form-check-label">
                                    Chuyển khoản ngân hàng
                                </label>

                            </div>

                        </div>

                        <div id="qrBox"
                             class="card mt-3"
                             style="display:none;">

                            <div class="card-header bg-primary text-white">

                                Thanh toán bằng QR

                            </div>

                            <div class="card-body text-center">

                                <img id="qrImage"
                                     width="280">

                                <h5 class="mt-3">

                                    MB Bank

                                </h5>

                                <p>

                                    STK:
                                    <strong>05362218001</strong>

                                </p>

                                <p>

                                    Chủ tài khoản:

                                    <strong>LE DANG MINH TRIET</strong>

                                </p>

                                <p>

                                    Nội dung:

                                    <strong id="transferContent"></strong>

                                </p>

                            </div>

                        </div>

                        <button class="btn btn-danger">

                            Đặt hàng

                        </button>

                    </form>

                </div>

            </div>

        </div>
        <div class="col-md-5">

            <div class="card">

                <div class="card-header bg-dark text-white">

                    Đơn hàng

                </div>

                <div class="card-body">

                    <table class="table">

                        <thead>

                        <tr>

                            <th>Sản phẩm</th>

                            <th>SL</th>

                            <th>Tiền</th>

                        </tr>

                        </thead>

                        <tbody>

                        <c:forEach items="${sessionScope.cart.items}"
                                   var="item">

                            <tr>

                                <td>

                                        ${item.product.name}

                                </td>

                                <td>

                                        ${item.quantity}

                                </td>

                                <td>

                                    <fmt:formatNumber
                                            value="${item.subTotal}"
                                            maxFractionDigits="0"/>

                                    đ

                                </td>

                            </tr>

                        </c:forEach>

                        </tbody>

                    </table>

                    <hr>

                    <div class="d-flex justify-content-between">

                        <h5>

                            Tổng tiền

                        </h5>

                        <h5 class="text-danger">

                            <fmt:formatNumber
                                    value="${sessionScope.cart.total}"
                                    maxFractionDigits="0"/>

                            đ

                        </h5>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<c:import url="../component/footer.jsp"/>

</body>

<script>

    function toggleQR(){

        let bank =
            document.querySelector("input[value='BANK']").checked;

        let qrBox =
            document.getElementById("qrBox");

        if(bank){

            qrBox.style.display="block";

            let amount =
                ${sessionScope.cart.total};

            let orderCode =
                "DH" + Date.now();

            document.getElementById("transferContent").innerHTML =
                orderCode;

            document.getElementById("qrImage").src=

                "https://img.vietqr.io/image/MB-123456789-compact2.png?amount="
                + amount
                + "&addInfo="
                + orderCode
                + "&accountName=LE%20DANG%20MINH%20TRIET";

        }else{

            qrBox.style.display="none";

        }

    }

</script>

</html>