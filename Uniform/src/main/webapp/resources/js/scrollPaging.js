var resultList = [];
var str;
$(document)
		.ready(
				function() {
					var firstCount = 0;
					var lastCount = 5;

					var jsonLocation = $("input[id*='Location']").val();
					var jsonType = $("input[id*='Type']").val();
					var jsonFirst = $("input[id*='firstDate']").val();
					var jsonLast = $("input[id*='lastDate']").val();
					if (jsonFirst == null || jsonFirst == " ") {
						jsonFirst = "fail";
					}
					if (jsonLast == null || jsonLast == " ") {
						jsonLast = "fail";
					}
					console.log(jsonLocation + " : " + jsonType + " : "
							+ jsonFirst + " : " + jsonLast);

					$
							.getJSON(
									'/uniform/scroll_result.json',
									{
										location : jsonLocation,
										type : jsonType,
										SfirstDate : jsonFirst,
										SlastDate : jsonLast
									},
									
									function(data) {
										console.log("data : " + data.length);
										$
												.getJSON(
														"/getStar",
														{
															type : "share"
														},
														function(result) {
															$(".star-wrap")
																	.each(
																			function(
																					i,
																					obj) {
																				if (i < $(result).length) {
																					var snos = result[i].sno;
																					var objSno = $(
																							this)
																							.data(
																									"sno");
																					if (snos == objSno) {
																						var num = result[i].avg;
																						var width = num * 15;
																						$(
																								".star-input"
																										+ snos
																										+ ">.input")
																								.css(
																										"background-position",
																										"0 bottom")
																								.css(
																										"width",
																										width
																												+ "px")
																								.css(
																										"z-index",
																										"100");
																					}
																				}
																			});
														})

										$.each(data, function(i, item) {

											resultList.push(item);
										});

										firstCount = 0;
										lastCount = 5;

										showList(resultList, firstCount,
												lastCount);

									});

					// Each time the user scrolls
					$(window)
							.scroll(
									function() {
										if ($(document).height()
												- $(window).height() == $(
												window).scrollTop()) {

											showList(resultList, firstCount,
													lastCount);

											firstCount += 5;
											lastCount += 5;

										}
									});

					function showList(resultList, firstCount, lastCount) {

						$
								.each(
										resultList,
										function(index, item) {
											var regDates = resultList[index].regDate
													.substring(0, 10);
											if (index >= firstCount
													&& index < lastCount) {
												console.log(resultList[index]);
												str = '<div class="col-md-12"> <div class="blog-entry"> ';
												str += '<a href="#" class="img img-2" style="background-image: url(/resources/images/image_1.jpg);"> </a> ';
												str += '<div class="text pt-3"> <h2 class="mb-2">'
														+ resultList[index].title
														+ '</h2> ';
												str += '<div class="meta-wrap"> <span>등록일 : '
														+ regDates + '</span> ';
												str += '<span>가격 : '
														+ resultList[index].price
														+ ' 원 </span> ';
												str += '<div class="star-wrap" data-sno = "'
														+ resultList[index].sno
														+ '"> <span class="star-input'
														+ resultList[index].sno
														+ '"> <span class="input"> </span> </span> </div>';
												str += '<div class="result-wrap"> <span class="star-input'
														+ resultList[index].sno
														+ '"> <span class="result"> </span> </span> </div> </div>';
												str += '<p> <a href="#" class="btn btn-primary">Read More <span class="ion-ios-arrow-forward"></span></a> </p>';
												str += '</div> </div> </div>';
												$(".resultList").append(str);
											}
										});
					}

					$("#topBtn").on("click", function() {
						$("html, body").animate({
							scrollTop : 0
						}, 300);
					});

					$("#bottomBtn").on("click", function() {
						$("html, body").animate({
							scrollTop : $(document).height()
						}, 300);
					});

				});