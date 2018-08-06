
{{ content() }}
<div class="base-slider owl-carousel owl-theme">
		<div class="item">

		</div>
	</div>
	<!--===================== End of Base Slider ========================-->

	<!--===================== Why Choose ========================-->
	<section class="bg-gray animatedParent">
		<div class="container">
			<div class="why-choose">
				<h2 class="title-head">{{ session.name }}</h2>
				<div class="row">
					<div class="col-md-4 col-xs-12 animated bounceInUp delay-250">

					</div>
					<div class="col-md-4 col-xs-12">
						<div class="mystyle">
							<button  onclick="test()" id="start" class="btn btn-default btn-lg ">{{btn_name}}</button>
						</div>
					</div>
					<div class="col-md-4 col-xs-12 animated bounceInUp delay-750">

					</div>
				</div>
			</div><!--why-choose-->
			<!--===================== Hosting Software ========================-->
			<div class="hosting-software">
				<hr></hr>
				<h2 class="title-head">Вы начали работу</h2>
				<ul id="counter">
					<li><b class="count" id="s_hour">0</b><span>час</span></li>
					<li><b class="count" id="s_min">00</b><span>минуты</span></li>
					<li><b class="count" id="s_second">00</b><span>секунд</span></li>

				</ul>
				<hr></hr>
				<h2 class="title-head">Прошло рабочего времени</h2>
				<ul id="counter">
					<li><b class="count" id="hour">0</b><span>час</span></li>
					<li><b class="count" id="min">00</b><span>минуты</span></li>
					<li><b class="count" id="second">00</b><span>секунд</span></li>

				</ul>
				<hr></hr>
				<h2 class="title-head">Начало рабочего времени</h2>
				<ul id="counter">
					<li><b class="count" id="hour">{{date_elements[0]}}</b><span>час</span></li>
					<li><b class="count" id="hour">{{date_elements[2]}}</b><span>минут</span></li>
					<li><b class="count" id="hour">{{date_elements[2]}}</b><span>секунд</span></li>

				</ul>
				<hr></hr>
				<h2 class="title-head" id="t_title"></h2>
				<ul id="counter">
					<li><b class="count" id="t_hour"></b><span>час</span></li>
					<li><b class="count" id="t_min"></b><span>минут</span></li>
					<li><b class="count" id="t_sec"></b><span>секунды</span></li>

				</ul>
			</div>
			<div class="hosting-software">

			</div>
			<!--===================== End of Hosting Software ========================-->
		</div>

	</section>
	<!--===================== End of Why Choose ========================-->
	<!--===================== Pricing Table ========================-->

