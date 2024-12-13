<div class="admin-sidebar-top">
    <a href="/client/list/food"><img src="{{asset('frontend/asset/images/logo.png')}}" alt=""><h3>ECOMMERCE</h3></a>
</div>
<div class="admin-sidebar-content">
    <ul>
        <li class="{{ request()->is('client/list/food') ? 'active' : '' }}">
            <a href="/client/list/food">
                <img src="{{ asset('frontend/asset/images/food.png') }}" alt="">
                <span>Đồ Ăn</span>
            </a>
        </li>
        <li class="{{ request()->is('client/list/drink') ? 'active' : '' }}">
            <a href="/client/list/drink">
                <img src="{{ asset('frontend/asset/images/drink.png') }}" alt="">
                <span>Đồ Uống</span>
            </a>
        </li>
        <li class="{{ request()->is('client/list/fruit') ? 'active' : '' }}">
            <a href="/client/list/fruit">
                <img src="{{ asset('frontend/asset/images/fruit.png') }}" alt="">
                <span>Rau Củ & Trái Cây</span>
            </a>
        </li>
        <li class="{{ request()->is('client/list/frozen') ? 'active' : '' }}">
            <a href="/client/list/frozen">
                <img src="{{ asset('frontend/asset/images/frozen-food.png') }}" alt="">
                <span>Đồ Đông Lạnh</span>
            </a>
        </li>
        <li class="{{ request()->is('client/list/snack') ? 'active' : '' }}">
            <a href="/client/list/snack">
                <img src="{{ asset('frontend/asset/images/snack.png') }}" alt="">
                <span>Đồ Ăn Vặt</span>
            </a>
        </li>
        <li class="{{ request()->is('client/list/condiment') ? 'active' : '' }}">
            <a href="/client/list/condiment">
                <img src="{{ asset('frontend/asset/images/condiments.png') }}" alt="">
                <span>Đồ Gia Vị</span>
            </a>
        </li>
        <li class="{{ request()->is('client/list/person_care') ? 'active' : '' }}">
            <a href="/client/list/person_care">
                <img src="{{ asset('frontend/asset/images/personal-care.png') }}" alt="">
                <span>Chăm Sóc Cá Nhân</span>
            </a>
        </li>
        <li class="{{ request()->is('client/list/house_care') ? 'active' : '' }}">
            <a href="/client/list/house_care">
                <img src="{{ asset('frontend/asset/images/house-care.png') }}" alt="">
                <span>Chăm Sóc Nhà Cửa</span>
            </a>
        </li>
        <li class="{{ request()->is('client/list/electric') ? 'active' : '' }}">
            <a href="/client/list/electric">
                <img src="{{ asset('frontend/asset/images/electric.png') }}" alt="">
                <span>Đồ Điện Tử</span>
            </a>
        </li>
    </ul>
</div>

<div class="admin-sidebar-bottom">
    <a href="http://aao.hcmut.edu.vn/index.php?route=information/contact" target="_blank"><img src="{{asset('frontend/asset/images/zalo.png')}}" alt=""><p>Zalo</p></a>
    <a href="https://www.instagram.com/bachkhoa.hcmut/" target="_blank"><img src="{{asset('frontend/asset/images/instagram.png')}}" alt=""><p>Instagram</p></a>
    <a href="https://www.facebook.com/truongdhbachkhoa" target="_blank"><img src="{{asset('frontend/asset/images/facebook.png')}}" alt=""><p>Facebook</p></a>
    <a href="https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+B%C3%A1ch+khoa+-+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+Qu%E1%BB%91c+gia+TP.HCM/@10.772075,106.6553269,17z/data=!3m1!4b1!4m6!3m5!1s0x31752ec3c161a3fb:0xef77cd47a1cc691e!8m2!3d10.772075!4d106.6579018!16s%2Fm%2F025yhhq?entry=ttu&g_ep=EgoyMDI0MTAyOS4wIKXMDSoASAFQAw%3D%3D" target="_blank">
        <img src="{{asset('frontend/asset/images/google-maps.png')}}" alt=""><p>Bản đồ</p></a>
</div>