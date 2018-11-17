$("[data-toggle=dropdown]+li").hide();
$("[data-toggle=dropdown]").parent().on("mouseover",function(){
    var $li=$(this);
    $li.children(":last-child").show();
})
//$("[data-trigger=dropdown]").parent().on("mouseout",function(){
    .on("mouseout",function(){
        var $li=$(this);
        $li.children(":last-child").hide();
    });