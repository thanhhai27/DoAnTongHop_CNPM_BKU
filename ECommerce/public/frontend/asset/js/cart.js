
// quantity-product
const quanPlus = document.querySelectorAll('.add-button');
const quanMinus = document.querySelectorAll('.subtract-button');
const quanInput = document.querySelectorAll('.quantity-input');

if (quanMinus.length > 0 && quanPlus.length > 0) {
    for (let index = 0; index < quanMinus.length; index++) {
        let qty = parseInt(quanInput[index].value); // Get the current value of input
        
        // Add event listener for increasing quantity
        quanPlus[index].addEventListener('click', () => {
            qty++; // Increment qty
            quanInput[index].value = qty; // Update input with new value
        });

        // Add event listener for decreasing quantity
        quanMinus[index].addEventListener('click', () => {
            if (qty > 1) { // Only decrease if qty is greater than 1
                qty--; // Decrement qty
                quanInput[index].value = qty; // Update input with new value
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







