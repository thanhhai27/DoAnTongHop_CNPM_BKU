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



// ------------------------------

