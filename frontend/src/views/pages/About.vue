<template>
   <!--About Section-->
    <section class="about-area bg-white">
        <!--div class="about-left dark-overlay wow fadeInUp" data-wow-delay="0.4s" :style="{'background-image': 'url(' + require('@/assets/images/about-us.jpg') + ') no-repeat center / cover'}" -->
        <div class="about-left" :style="{'background-image': 'url(' + require('@/assets/images/about-us.jpg') + ') '}" >
            <div class="left-img-wrap">
                <a href="https://www.youtube.com/watch?v=GT6-H4BRyqQ" class="video-popup"><img src="@/assets/images/play-button.png" alt=""></a>
            </div>
        </div>
        <div class="about-content mid-bg-gray wow fadeInUp" data-wow-delay="0.4s">
            <div class="about-content-inner">
                <div class="section-title">
                    <h2>緣起</h2>
                </div>
                <p>
台灣近年來在M型化社會的趨勢下，使得低收⼊⼾增加，加上⼈⼝嚴重⽼齡化，
社會上弱勢、需要關懷的聲⾳越來越多。我們時常在報章媒體聽到或看到許多
社會救難事件或是流浪動物的救助需求，但很多有愛⼼的⼈，卻常常因為擔⼼
⾃⼰的愛⼼捐款可能被不肖機構私吞、不當挪⽤，或是現代⼈⽣活過於忙碌，
⽽遲遲沒有⾏動。
我們意識到這是個很令⼈感到遺憾的現象，希望能創造⼀個更便利、簡潔、
透明化的網路募款平台來⿎勵⼤眾能更熱衷於⽇⾏⼀善來捐款送暖給社會上需要
幫助的弱勢族群，協助他們度過急難。</p>
<h3>服務宗旨</h3>
<br>
<p>
「⼀⽇⼀募」是⼀個政府合法⽴案的⾮營利公益募款平台。我們希望能藉由這個
平台所發起的募款⾏動，⿎勵、提醒更多有能⼒的⼈可以發揮愛⼼和善⼼來捐款
給所需要幫助的⼈或團體。並且透過網路平台的⽅式，讓需要幫助的⼈可清楚地
表明需求，讓社會⼤眾能更直接快速的注意到這些弱勢族群並捐款幫助他們。募
到的款項之去向本會也嚴格把關並透明化，捐款者能放⼼透過平台讓捐款送到所
需要幫助的⼈或團體⼿中。
                </p>
                <h3>以下是本會提供之募款服務:</h3>
                <br>
                <p>
                <ul>
                    <li><i class="fa fa-angle-double-right"></i>急難救助</li>
                    <li><i class="fa fa-angle-double-right"></i>醫療補助</li>
                    <li><i class="fa fa-angle-double-right"></i>喪葬補助</li>
                    <li><i class="fa fa-angle-double-right"></i>流浪動物救助</li>
                    <li><i class="fa fa-angle-double-right"></i>公益募款</li>
                </ul> 
</p>
                <p>俗語說，助⼈為快樂之本。光是憐憫還不夠，及時伸出援⼿的才是真正的同情者。
本會期望更多⼈能透過這個募資網站平台接收到愛與溫暖，透過眾⼈累積集資的⼒
量，讓社會弱勢的⻆落看到希望。</p>               
            </div>
        </div>
    </section>
    <!--/About Section-->
</template>

<script>

export default {
  name: "About",
  components: {
  },
  data() {
    return {
    };
  },
};
</script>