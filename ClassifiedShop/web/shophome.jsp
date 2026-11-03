<%@include file="shopheader.jsp" %>

<%!
    PreparedStatement ps1 = null;
    ResultSet rs1 = null;
%>

<title>SHOP SPHERE | Add Product</title>

<style>

.ss-product-page {
    padding: 35px 10px 60px;
    font-family: Arial, sans-serif;
}

.ss-product-heading {
    margin-bottom: 30px;
}

.ss-product-heading h1 {
    color: #14233f;
    font-size: 34px;
    font-weight: 800;
}

.ss-product-heading p {
    color: #7d8798;
    font-size: 15px;
}

.ss-orange {
    color: #ff872f;
}

.ss-view-btn {
    display: inline-block;
    background: #14233f;
    color: white !important;
    padding: 12px 22px;
    border-radius: 8px;
    text-decoration: none !important;
    font-weight: bold;
    margin-bottom: 25px;
}

.ss-view-btn:hover {
    background: #ff872f;
}

.ss-product-card {
    background: white;
    border-radius: 16px;
    padding: 35px;
    box-shadow: 0 8px 30px rgba(20,35,63,0.09);
    border-top: 5px solid #ff872f;
}

.ss-section-title {
    color: #14233f;
    font-size: 21px;
    font-weight: 800;
    margin-bottom: 25px;
    border-bottom: 1px solid #e8edf4;
    padding-bottom: 15px;
}

.ss-form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 22px;
}

.ss-form-group {
    margin-bottom: 18px;
}

.ss-form-group.full {
    grid-column: 1 / -1;
}

.ss-form-group label {
    display: block;
    color: #14233f;
    font-size: 14px;
    font-weight: 700;
    margin-bottom: 10px;
}

.ss-form-group input,
.ss-form-group select,
.ss-form-group textarea {
    width: 100%;
    padding: 14px;
    box-sizing: border-box;
    background: #f3f6fb;
    border: 1px solid #e1e7f1;
    border-radius: 8px;
    font-size: 14px;
    outline: none;
    color: #14233f;
}

.ss-form-group input:focus,
.ss-form-group select:focus,
.ss-form-group textarea:focus {
    border-color: #ff872f;
    box-shadow: 0 0 0 3px rgba(255,135,47,0.10);
}

.ss-form-group textarea {
    resize: vertical;
    min-height: 100px;
}

.ss-image-box {
    background: #f8f9fc;
    border: 1px dashed #c5cedd;
    border-radius: 10px;
    padding: 18px;
    margin-bottom: 15px;
}

.ss-image-box label {
    color: #14233f;
    font-weight: bold;
    display: block;
    margin-bottom: 12px;
}

.ss-image-box input {
    width: 100%;
}

.ss-required {
    color: #ff872f;
}

.ss-publish-btn {
    width: 100%;
    padding: 17px;
    background: #ff872f;
    border: none;
    border-radius: 9px;
    color: white;
    font-size: 16px;
    font-weight: 800;
    cursor: pointer;
    margin-top: 20px;
    transition: 0.3s;
}

.ss-publish-btn:hover {
    background: #14233f;
    transform: translateY(-2px);
}

.ss-note {
    background: #fff5ed;
    border-left: 4px solid #ff872f;
    padding: 15px;
    color: #555;
    font-size: 13px;
    margin-bottom: 25px;
    border-radius: 5px;
}

@media(max-width: 650px) {
    .ss-form-grid {
        grid-template-columns: 1fr;
    }

    .ss-form-group.full {
        grid-column: auto;
    }

    .ss-product-card {
        padding: 20px;
    }

    .ss-product-heading h1 {
        font-size: 27px;
    }
}

</style>

<div class="ss-product-page">

    <div class="ss-product-heading">

        <h1>Add New <span class="ss-orange">Product</span></h1>

        <p>Showcase your products and grow your business with SHOP SPHERE.</p>

    </div>

    <a href="shvproducts.jsp" class="ss-view-btn">
        View Your Products &#8594;
    </a>

    <div class="ss-product-card">

        <div class="ss-section-title">
            Product Information
        </div>

        <div class="ss-note">
            Fill in the product details carefully.
            Fields marked with * are mandatory.
        </div>

        <%
            ps1 = conn.prepareStatement("SELECT cname FROM categories");
            rs1 = ps1.executeQuery();
        %>

        <form name="f"
              action="shophome1.jsp"
              method="post"
              enctype="multipart/form-data">

            <div class="ss-form-grid">

                <div class="ss-form-group">

                    <label>Product Category <span class="ss-required">*</span></label>

                    <select name="cname" required>

                        <%
                            while(rs1.next()) {
                        %>

                        <option value="<%=rs1.getString(1)%>">
                            <%=rs1.getString(1)%>
                        </option>

                        <%
                            }
                            rs1.close();
                            ps1.close();
                        %>

                    </select>

                </div>

                <div class="ss-form-group">

                    <label>Brand Name <span class="ss-required">*</span></label>

                    <input type="text"
                           name="brand"
                           placeholder="Enter brand name"
                           required>

                </div>

                <div class="ss-form-group">

                    <label>Model Name <span class="ss-required">*</span></label>

                    <input type="text"
                           name="modelname"
                           placeholder="Enter product model"
                           required>

                </div>

                <div class="ss-form-group">

                    <label>Price (?) <span class="ss-required">*</span></label>

                    <input type="number"
                           name="price"
                           placeholder="Enter product price"
                           min="1"
                           step="0.01"
                           required>

                </div>

                <div class="ss-form-group">

                    <label>Discount (%) <span class="ss-required">*</span></label>

                    <input type="number"
                           name="discount"
                           placeholder="Enter discount percentage"
                           min="0"
                           max="100"
                           step="0.01"
                           required>

                </div>

                <div class="ss-form-group full">

                    <label>Product Specifications <span class="ss-required">*</span></label>

                    <textarea name="specs"
                              placeholder="Describe your product features, specifications and details..."
                              required></textarea>

                </div>

            </div>

            <div class="ss-section-title" style="margin-top:30px;">
                Product Images
            </div>

            <div class="ss-form-grid">

                <div class="ss-image-box">

                    <label>Product Image 1 *</label>
                    <input type="file" name="img1" accept="image/*" required>

                </div>

                <div class="ss-image-box">

                    <label>Product Image 2 *</label>
                    <input type="file" name="img2" accept="image/*" required>

                </div>

                <div class="ss-image-box">

                    <label>Product Image 3 *</label>
                    <input type="file" name="img3" accept="image/*" required>

                </div>

                <div class="ss-image-box">

                    <label>Product Image 4 *</label>
                    <input type="file" name="img4" accept="image/*" required>

                </div>

                <div class="ss-image-box">

                    <label>Product Image 5 (Optional)</label>
                    <input type="file" name="img5" accept="image/*">

                </div>

            </div>

            <div class="ss-section-title" style="margin-top:30px;">
                Shop Location
            </div>

            <div class="ss-form-group">

                <label>Google Maps URL <span class="ss-required">*</span></label>

                <textarea name="gmap"
                          placeholder="Paste your Google Maps location URL here..."
                          required></textarea>

            </div>

            <button type="submit"
                    name="submit1"
                    class="ss-publish-btn">

                PUBLISH PRODUCT &#8594;

            </button>

        </form>

    </div>

</div>

<%@include file="footer.jsp" %>