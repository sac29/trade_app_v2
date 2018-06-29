var flashdata = document.getElementsByName('flashdata')[0].getAttribute('content');
if(flashdata!='')
{
    var flash_object = JSON.parse(flashdata);
    swal(flash_object.title.toString(),flash_object.msg.toString(),flash_object.type.toString());
}