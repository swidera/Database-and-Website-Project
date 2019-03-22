function deletePlayer(pid) {
  $.ajax({
    url: '/Player/' + pid,
    type: 'DELETE',
    success: function(result){
      window.location.reload(true);
    }
  })
};
