// quantity-product
const quanPlus = document.querySelectorAll('.ri-add-line');
const quanMinus = document.querySelectorAll('.ri-subtract-line');
const quanInput = document.querySelectorAll('.quantity-input');

if (quanMinus != null && quanPlus != null) {
    for (let index = 0; index < quanMinus.length; index++) {
        let qty = parseInt(quanInput[index].value); // Lấy giá trị hiện tại của input
        
        // Thêm sự kiện khi nhấn nút tăng số lượng
        quanPlus[index].addEventListener('click', () => {
            qty++; // Tăng giá trị qty
            quanInput[index].value = qty; // Cập nhật input với giá trị mới
        });

        // Thêm sự kiện khi nhấn nút giảm số lượng
        quanMinus[index].addEventListener('click', () => {
            if (qty > 1) { // Chỉ giảm khi qty lớn hơn 1
                qty--; // Giảm giá trị qty
                quanInput[index].value = qty; // Cập nhật input với giá trị mới
            }
        });
    }
}

// ô drop-down
document.querySelector('.profile-menu').addEventListener('click', function() {
    var dropdown = this.querySelector('.dropdown-content');
    dropdown.classList.toggle('show'); // Thêm hoặc xóa class 'show'
});

// Đóng dropdown nếu nhấn ra ngoài
window.addEventListener('click', function(e) {
    if (!e.target.closest('.profile-menu')) {
        var dropdowns = document.querySelectorAll('.dropdown-content');
        dropdowns.forEach(function(dropdown) {
            dropdown.classList.remove('show'); // Ẩn tất cả dropdown
        });
    }
});


// hiển thị của mật khẩu
//hiển thị mật khẩu phần thya đổi mật khẩu
function togglePasswordVisibility(passwordId, icon) {
    const passwordInput = document.getElementById(passwordId);
    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        icon.classList.remove("ri-eye-off-fill");
        icon.classList.add("ri-eye-fill");
    } else {
        passwordInput.type = "password";
        icon.classList.remove("ri-eye-fill");
        icon.classList.add("ri-eye-off-fill");
    }
}



// sắp xếp sản phẩm đã được search 
function sortProducts(order) {
    const keyword = document.querySelector('input[name="keyword"]').value; // Lấy giá trị từ ô input
    const url = new URL(window.location.href); // Tạo URL từ trang hiện tại
    url.searchParams.set('sort', order); // Thêm tham số sort
    if (keyword) {
        url.searchParams.set('keyword', keyword); // Thêm tham số keyword
    }
    window.location.href = url.toString(); // Chuyển hướng đến URL mới
}

