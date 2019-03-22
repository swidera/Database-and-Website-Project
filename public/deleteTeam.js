function deleteTeam(tid) {
  $.ajax({
    url: '/Team/' + tid,
    type: 'DELETE',
    success: function(result) {
      window.location.reload(true);
    }
  })
};
