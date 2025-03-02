<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
    <meta name="author" content="Hỏi Dân IT" />
    <title>Dashboard - Update Product</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
      $(document).ready(() => {
        const productImage = $("#productImage");
        const orgImage = "${updateProduct.image}";
        if (orgImage) {
            const urlImage = "/images/product/" + orgImage;
            $('#productPreview').attr("src", urlImage);
            $("#productPreview").css({ "display": "block" });
        }

        productImage.change(function (e) {
          const imgURL = URL.createObjectURL(e.target.files[0]);
          $("#productPreview").attr("src", imgURL);
          $("#productPreview").css({ "display": "block" });
        });
      });
    </script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp" />
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Manage Products</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item">
                            <a href="/admin">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">
                            Products
                        </li>
                    </ol>
                    <div class="mt-5 row">
                      <div class="col-md-6 col-12 mx-auto">
                        <h3>Update a Product</h3>
                        <hr>
                        <form:form action="/admin/product/update" 
                              method="post" 
                              modelAttribute="updateProduct"
                              class="row g-3"
                              enctype="multipart/form-data"
                              >
                            <form:input path="id" type="hidden" class="form-control" />
                            <div class="col-md-6">
                              <c:set var="errorName">
                                <form:errors path="name" cssClass="invalid-feedback"/>
                              </c:set>
                              <label for="name" class="form-label">Name:</label>
                              <form:input path="name" type="text" class="form-control ${not empty errorName ? 'is-invalid' : ''}"/>
                              ${errorName}
                            </div>
                            <div class="col-md-6">
                              <c:set var="errorPrice">
                                <form:errors path="price" cssClass="invalid-feedback"/>
                              </c:set>
                              <label for="price" class="form-label">Price:</label>
                              <form:input path="price" type="number" class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"/>
                              ${errorPrice}
                            </div>
                            <div class="col-12">
                              <c:set var="errorDetailDesc">
                                <form:errors path="detailDesc" cssClass="invalid-feedback"/>
                              </c:set>
                              <label for="detailDesc" class="form-label">Detail description:</label>
                              <form:textarea path="detailDesc" class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"></form:textarea>
                              ${errorDetailDesc}
                            </div>
                            <div class="col-md-6">
                              <c:set var="errorShortDesc">
                                <form:errors path="shortDesc" cssClass="invalid-feedback"/>
                              </c:set>
                              <label for="shortDesc" class="form-label">Short description:</label>
                              <form:input path="shortDesc" type="text" class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}"/>
                              ${errorShortDesc}
                            </div>
                            <div class="col-md-6">
                              <c:set var="errorQuantity">
                                <form:errors path="quantity" cssClass="invalid-feedback"/>
                              </c:set>
                              <label for="quantity" class="form-label">Quantity:</label>
                              <form:input path="quantity" type="number" class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"/>
                              ${errorQuantity}
                            </div>
                            <div class="col-md-6">
                              <label for="factory" class="form-label">Factory:</label>
                              <form:select class="form-select" path="factory">
                                <form:option value="APPLE">Apple (MacBook)</form:option>
                                <form:option value="ASUS">Asus</form:option>
                                <form:option value="LENOVO">Lenovo</form:option>
                                <form:option value="DELL">Dell</form:option>
                                <form:option value="LG">LG</form:option>
                                <form:option value="ACER">Acer</form:option>
                              </form:select>
                            </div>
                            <div class="col-md-6">
                                <label for="target" class="form-label">Target:</label>
                                <form:select class="form-select" path="target">
                                  <form:option value="GAMING">Gaming</form:option>
                                  <form:option value="SINHVIEN-VANPHONG">Sinh viên - Văn phòng</form:option>
                                  <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa</form:option>
                                  <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                  <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                </form:select>
                              </div>
                            <div class="col-12">
                              <label for="productImage" class="form-label">Image:</label>
                              <form:input path="" type="file" class="form-control" id="productImage"
                                          accept=".png, .jpg, .jpeg" name="productFile"/>
                            </div>
                            <div class="col-12">
                              <img alt="Product Preview" id="productPreview" 
                                  style="max-height: 250px; display: none;" class="mx-auto"/>
                            </div>
                            <div class="col-md-3">
                              <button type="submit" class="btn btn-primary">Update</button>
                              <a href="/admin/product" class="btn btn-secondary">Back</a>
                            </div>
                        </form:form>
                      </div>
                    </div>
                </div>
            </main>
            <jsp:include page="../layout/footer.jsp"/>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
</body>

</html>