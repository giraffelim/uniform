<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div id="colorlib-main">
	<!--title -------------------------------- -->
	<section class="ftco-section ftco-no-pt ftco-no-pb mb-5 ftco-intro">
		<div class="container-fluid px-3 px-md-0">
			<div class="row justify-content-end">
				<div class="col-md-10 mt-3">
					<h1 class="mb-5">
 						<span id="font-red">All Of Workplace</span>
 						SHARE PLACE<br>
 						LEASE PLACE
 					</h1>
					<div class="row">
						<div class="col-md-6">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--title-->

	<!--count ----------------------------- -->
    <section class="ftco-section ftco-no-pt ftco-counter img"
        id="section-counter">
        <div class="container-fluid px-3 px-md-0">
            <div class="row d-md-flex align-items-center justify-content-end">
                <div class="col-md-10">
                    <div class="row d-md-flex align-items-start">
                        <div
                            class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                            <div class="block-18">
                                <div class="text">
                                    <strong class="number" data-number="${memberCount }">0</strong>
                                    <span>명의 회원이 사용 중 입니다!</span>
                                </div>
                            </div>
                        </div>
                        <div
                            class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                            <div class="block-18">
                                <div class="text">
                                    <strong class="number" data-number="${workplace_SCount }">0</strong>
                                    <span>개의 공유 작업실이 준비되어있어요!</span>
                                </div>
                            </div>
                        </div>
                        <div
                            class="col-md d-flex justify-content-center counter-wrap ftco-animate">
                            <div class="block-18">
                                <div class="text">
                                    <strong class="number" data-number="${workplace_ICount }">0</strong>
                                    <span>개의 임대 작업실이 준비되어있어요!</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--count-->

	<!--workPlace --------------------------------- -->
    <section class="ftco-section px-0">
        <div class="container-fluid px-0 border">
            <div class="row justify-content-end">
                <div class="col-md-10">
                    <div id="home" class="video-hero js-fullheight"
                        style="height: 700px; background-image: url(/resources/images/index.gif); background-size: cover; background-position: center center;">
                        <div class="container">
                            <div
                                class="row js-fullheight justify-content-center d-flex align-items-start">
                                <div class="col-md-10">
                                    <div class="text">
                                        <h1>
                                            Share <span><a href="#">WorkPlace</a></span>
                                        </h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--workPlace-->


	<section class="ftco-services ftco-section">
        <div class="container-fluid px-3 px-md-0">
            <div class="row justify-content-end">
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-4 d-flex align-self-stretch ftco-animate">
                            <div class="media block-6 services d-block">
                                <div
                                    class="icon d-flex justify-content-center align-items-center">
                                    <span class="flaticon-idea"></span>
                                </div>
                                <div class="media-body p-2 mt-3">
                                    <h3 class="heading">UNIFORM</h3>
                                    <p>
                                        저희 <b>UNIFORM</b>은 유튜브 니도 폼나게 할 수 있어라는 뜻으로 노련한 크리에이터뿐만 아니라 초보
                                        크리에이터들에게 작업 공간을 임대해주고 여러 유튜버들이 작업 공간을 공유하여 사용할 수 있도록 해주어
                                        	경제적인 부담 및 시간 제한을 덜어주고자 시작한 플랫폼 입니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 d-flex align-self-stretch ftco-animate">
                            <div class="media block-6 services d-block">
                                <div
                                    class="icon d-flex justify-content-center align-items-center">
                                    <span class="flaticon-compass-symbol"></span>
                                </div>
                                <div class="media-body p-2 mt-3">
                                    <h3 class="heading">Share WorkPlace</h3>
                                    <p>
                                        <b>UNIFORM</b>에서는 혼자가 아닌 여러 사람과 함께 하나의 작업실을 공유할 수 있는 시스템이 준비되어 있습니다.
                                        	단 글을 등록하는 사람은 작업실을 보유하고 있어야 하며, 함께 사용할 인원은 몇명인지 내가 사용할 시간은 몇시인지
                                        	를 명시 해주셔야 합니다. 
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 d-flex align-self-stretch ftco-animate">
                            <div class="media block-6 services d-block">
                                <div
                                    class="icon d-flex justify-content-center align-items-center">
                                    <span class="flaticon-layers"></span>
                                </div>
                                <div class="media-body p-2 mt-3">
                                    <h3 class="heading">Lease WorkPlace</h3>
                                    <p>
                                        <b>UNIFORM</b>에서는 작업실을 시간 단위로 이용할 수 있습니다. 작업실을 보유하고 있는 사람이나 기업이 글을
                                        	등록하게 되면 사용자는 자신이 사용하고 싶은 시간대에 맞춰 예약을 진행 하고 사용할 수 있습니다.
                                        	 
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<!--work people ---------------------- -->
    <section class="ftco-section" id="people-section">
        <div class="container-fluid px-3 px-md-0">
            <div class="row">
                <div class="col-md-6 project">
                    <div class="img js-fullheight"
                        style="background-image: url(/resources/images/indexImg.jpg);">
                        <div class="text text-2 text-center">
                            <h2>
                                <a href="/uniform/getLeaseAll?selectChoice=imde&location= &SfirstDate=fail&SlastDate=fail">lease</a>
                            </h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 project">
                    <div class="img js-fullheight"
                        style="background-image: url(/resources/images/indexImgS.jpg);">
                        <div class="text text-2 text-center">
                            <h2>
                                <a href="/uniform/getShareAll?selectChoice=share&location= &SfirstDate=fail&SlastDate=fail">share</a>
                            </h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 text-center ftco-animate">
                    <h2>
                        <a href="/uniform/hotTopicList" class="btn-custom-2">View All
                            WorkPlace</a>
                    </h2>
                </div>
            </div>
        </div>
    </section>
    <!--work people-->

	<%@include file="../includes/footer.jsp"%>
