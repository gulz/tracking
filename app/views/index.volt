<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
   <meta charset="UTF-8">
   	<title>Tracking System</title>
   	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.5">
   	<!-- Framework Css -->
<script type="text/javascript">
    function testtime(){
        var a="{{t_status}}";
        var b="{{btn_name}}";
        if(b=='стоп'){

            int  = setInterval(function() { // запускаем интервал
                if(sec>=60)
                {
                    sec=0;
                    min=min+1;
                }
                if(min>=60)
                {
                    sec=0;
                    min=0;
                    hour=hour+1;
                }
                $('#hour').text(hour);
                $('#second').text(sec);
                $('#min').text(min);
                sec++;
            }, 1000);
        }

        if(a){

            var t_hour=parseInt("{{tardiness[0]}}");
            var t_min=parseInt("{{tardiness[1]}}");
            var t_sec=parseInt("{{tardiness[2]}}");
            $('#t_title').text("Вы опоздали на");
            int = setInterval(function() { // запускаем интервал
                if(t_sec>=60)
                {
                    t_sec=0;
                    t_min=t_min+1;
                }
                else
                if(t_min>=60)
                {
                    t_sec=0;
                    t_min=0;
                    t_hour=t_hour+1;
                }
                $('#t_hour').text(t_hour);
                $('#t_sec').text(t_sec);
                $('#t_min').text(t_min);
                t_sec++;
            }, 1000);

        }
        else
        {
            var t_hour=parseInt("{{tardiness[0]}}");
            var t_min=parseInt("{{tardiness[1]}}");
            var t_sec=parseInt("{{tardiness[2]}}");
            $('#t_title').text("Работа начинается через");
            int = setInterval(function() { // запускаем интервал
                if(t_sec<0)
                {
                    t_sec=59;
                    t_min=t_min-1;
                }
                else
                if(t_min<0)
                {
                    t_sec=59;
                    t_min=59;
                    t_hour=t_hour-1;
                }
                $('#t_hour').text(t_hour);
                $('#t_sec').text(t_sec);
                $('#t_min').text(t_min);
                t_sec--;
            }, 1000);
        }
      /*  var a="{{work_time}}";

        $('#s_hour').text(a[0]);
        $('#s_second').text(a[1]);
        $('#s_min').text(a[2]);*/
    }
</script>
	{{ assets.outputCss() }}
</head>
 {% if(session.has('login'))%}

<body onload="testtime()">

{% else %}
<body>
{%endif%}
               {{ content() }}

        {{ javascript_include('js/jquery.min.js') }}
        {{ javascript_include('js/bootstrap.min.js') }}
        {{ javascript_include('js/utils.js') }}
        <footer>
        	<div class="container">

        		<div class="copyright">
        			<p>&copy; Copyright 2018 zhigit1993@gmail.com, All Rights Reserved</p>
        		</div><!--copyright-->
        	</div>
        </footer>
        <!--===================== End of Footer ========================-->
        </div>
<!--wrapper-->



<script type="text/javascript">
    function funcSucces(data){

        var a=JSON.parse(data);

        $('#s_hour').text(a[0]);
        $('#s_second').text(a[1]);
        $('#s_min').text(a[2]);


    }
    function funcBefore(){
        $("#tr_set").text("ожидаем данные");
    }
function test(){
    var a=$('#start').text();

    if(a=='запуск')
	{
	    var stat="start";
        $.ajax({
            url:"worktest",
            type:"post",
            data:({stat:stat}),
            datatype:"html",
            beforeSend:funcBefore,
            success:funcSucces
        });
        $('#start').text('стоп');
        for(var i = 1; i < 100; i++) {
            clearTimeout(i);
        }


        var dt = new Date();
        var hour=0;
        var min = 0;
        var sec=0;
        int  = setInterval(function() { // запускаем интервал
            if(sec>=60)
            {
                sec=0;
                min=min+1;
            }
            if(min>=60)
            {
                sec=0;
                min=0;
                hour=hour+1;
            }
            $('#hour').text(hour);
            $('#second').text(sec);
            $('#min').text(min);
            sec++;
        }, 1000);
	}
	else
	    if(a=='стоп')
	{
        var stat="stop";
        $.ajax({
            url:"worktest",
            type:"post",
            data:({stat:stat}),
            datatype:"html",
            beforeSend:funcBefore,
            success:funcSucces
        });
        $('#start').text('вы отработали за сегодня');
	}




}

</script>
        <script src="assets/js/lib/jquery.js"></script>
        <script src="assets/js/lib/bootstrap.min.js"></script>
        <script src="assets/js/lib/owl.carousel.min.js"></script>
        <script src="assets/js/lib/css3-animate-it.js"></script>
        <script src="assets/js/lib/counter.js"></script>
        <script src="assets/js/main.js"></script>
        </body>
        </html>

