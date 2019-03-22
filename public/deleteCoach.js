function deleteCoach(cid) {
    $.ajax({
        url: '/Coach/' + cid,
        type: 'DELETE',
        success: function (result) {
            window.location.reload(true);
        }
    });
}
