/*********************************************************************************************/
// FOr Cookies Part:
 
function WriteCookie(name1,value1,price,urlv,qnt1)
{
 
    var name="cd"+name1;
    var value11 = value1.split(' ').join('+');
    var value=value11+"_"+price+"_"+urlv+"_"+"1";
        var date = new Date();
        date.setTime(date.getTime()+(60*60*3000));
        var expires = "; expires="+date.toGMTString();
        document.cookie = name+"="+value+expires+"; path=/"; 
     
        alert("Your Item is added to the Cart:)");
    //alert ("cookie="+document.cookie);    
    //alert ("cdid="+name1+" is added to your cart!");
}
function createcookie(to,bttn ){
    name="total";
    var value=to;
    var date = new Date();
    date.setTime(date.getTime()+(60*60*3000));
    var expires = "; expires="+date.toGMTString();
        document.cookie = name+"="+value+expires+"; path=/";
               
        //alert ("cookie="+document.cookie);   
}
 
function WritetoCookie(name,value1,price,urlv,qnt1,totv)
{
    
     var area = document.getElementById(qnt1);
     
     var value11 = value1.split(' ').join('+');
    var value=value11+"_"+price+"_"+urlv+"_"+area.value;
        var date = new Date();
        date.setTime(date.getTime()+(60*60*3000));
        var expires = "; expires="+date.toGMTString();
        document.cookie = name+"="+value+expires+"; path=/";
        
     //   location.reload();
         
//alert ("document.cookie"+document.cookie);
 
}
 function refresh(){location.reload();}
 
 
function eraseCookie (name1,bttn) {
    var expires = 'Thu, 01 Jan 1970 00:00:01 GMT';
    //alert ("document.cookie"+document.cookie);
    document.cookie =name1+"="+";"+expires+"; path=/";  
    document.getElementById(bttn).disabled = true;
    document.getElementById(bttn).value='Deleted';
    var bttn1="u"+bttn;
    document.getElementById(bttn1).disabled = true;
    
    //document.write ("docment cookies : " +document.cookie);
   // location.reload();
}
 
function repf(tit){
    return tit.split('+').join(' ');
}

function noItemInStock(){
	  alert("No item left in stock!");
	}

/**********************************************************************************************/
 
/* For SingUp/Login Form**********************************************************************/
$('.form').find('input, textarea').on('keyup blur focus', function (e) {
   
  var $this = $(this),
      label = $this.prev('label');
 
    if (e.type === 'keyup') {
      if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
      if( $this.val() === '' ) {
        label.removeClass('active highlight'); 
      } else {
        label.removeClass('highlight');   
      }   
    } else if (e.type === 'focus') {
       
      if( $this.val() === '' ) {
        label.removeClass('highlight'); 
      } 
      else if( $this.val() !== '' ) {
        label.addClass('highlight');
      }
    }
 
});
 
$('.tab a').on('click', function (e) {
   
  e.preventDefault();
   
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
   
  target = $(this).attr('href');
 
  $('.tab-content > div').not(target).hide();
   
  $(target).fadeIn(600);
   
});


