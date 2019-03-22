function deleteFrontOffice(ID_Front_Office) {
  $.ajax({
    url: '/FrontOffice/' + ID_Front_Office,
    type: 'DELETE',
    success: function(result){
      window.location.reload(true);
    }
  })
};
