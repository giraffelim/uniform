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
 						<span id="font-red">YouTube</span> Integration PlatForm
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
                                        저희 <b>UNIFORM</b>은 유튜브 니도 폼나게 할 수 있어라는 뜻으로 노련한 유튜버뿐만 아니라 초보
                                        유튜버들에게 작업 공간을 임대해주고 여러 유튜버들이 작업 공간을 공유하여 사용할 수 있도록 소개시켜주는
                                        플랫폼입니다.
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
                                        <b>UNIFORM</b>에서 소개시켜주는 공유 작업실은 작업실을 가지고 있는 한 유튜버가 다른 유튜버와 작업
                                        공간을 공유하여 사용하기 위해 작업 공간의 정보를 등록합니다. 이 작업실을 사용하고 싶은 다른 유튜버가 신청을
                                        할 수 있습니다.
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
                                        <b>UNIFORM</b>에서 소개시켜주는 임대 작업실은 작업 공간을 가지고만 있고 사용하지 않은 사람이 작업
                                        공간의 정보를 등록합니다. 이 작업실 을 사용하고 싶은 유튜버는 시간을 설정하여 신청할 수 있습니다.
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
                                <a href="#">lease</a>
                            </h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 project">
                    <div class="img js-fullheight"
                        style="background-image: url(/resources/images/indexImgS.jpg);">
                        <div class="text text-2 text-center">
                            <h2>
                                <a href="#">share</a>
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
