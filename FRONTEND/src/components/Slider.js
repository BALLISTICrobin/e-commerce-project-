import React from 'react'

export default function Slider() {
  return (
    <div id="carouselExampleFade" class="carousel slide carousel-fade my-5" data-bs-ride="carousel" data-bs-interval="1000">
      <div class="carousel-inner" style={{ height: '65vh' }}>
        <div class="carousel-item active">
          <img src="https://c0.wallpaperflare.com/preview/581/155/730/technology-aesthetic-flatlays-design.jpg" class="d-block w-100" alt="slide 1" style={{ objectFit: 'cover', height: '100%', width: '100%' }} />
          
        </div>
        <div class="carousel-item">
          <img src="https://png.pngtree.com/background/20230528/original/pngtree-retro-gadgets-in-black-and-pink-lighting-picture-image_2776428.jpg" class="d-block w-100" alt="slide 2" style={{ objectFit: 'cover', height: '100%', width: '100%' }} />
          
        </div>
        <div class="carousel-item">
          <img src="https://www.ortigasmalls.com/wp-content/uploads/2019/07/5_Hottest_Gadgets_that_Click_with_Techies.jpg" class="d-block w-100" alt="slide 3" style={{ objectFit: 'cover', height: '100%', width: '100%' }} />
          
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>






  )
}
