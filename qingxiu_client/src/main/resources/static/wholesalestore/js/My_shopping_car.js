// JavaScript Document



  
  
  
    $(document).ready (function ()
    {
        var pl = $("p:last");
        var reg = /(.*[\:\：]\s*)([\+\d\.]+)(\s*元)/g;
        $ (".sy_minus").click (function ()
        {
            var me = $ (this), txt = me.next (":text"), pc = me.closest("h5");
            var val = parseFloat (txt.val ());
            val = val < 1 ? 1 : val;
            txt.val (val - 1);
            var price = parseFloat (pc.prev("h5").text().replace(reg,'$2')) * txt.val ();
            pc.next("h5").text (pc.next("h5").text().replace(reg, "$1" + price + "$3"));
            var sum = 0;
            $(".p_num").next("h5").each(function (i, dom)
            {
                sum += parseFloat ($(this).text().replace(reg, "$2"));
            });
 //           pl.text(pl.text().replace(reg, "$1" + sum + "$3"));
        });
         
        $(".sy_plus").click (function ()
        {
            var me = $ (this), txt = me.prev (":text"), pc = me.closest("h5");
            var val = parseFloat (txt.val ());
            txt.val (val + 1);
            var price = parseFloat (pc.prev("h5").text().replace(reg,'$2')) * txt.val ();
            pc.next("h5").text (pc.next("h5").text().replace(reg, "$1" + price + "$3"));
            var sum = 0;
            $(".p_num").next("h5").each(function (i, dom)
            {
                sum += parseFloat ($(this).text().replace(reg, "$2"));
            });
    //        pl.text(pl.text().replace(reg, "$1" + sum + "$3"));
        });
    })[0].onselectstart = new Function ("return false");
