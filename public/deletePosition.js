function deletePosition(ID_Player) {
    $.ajax({
        url: '/Position/' + ID_Player,
        type: 'DELETE',
        success: function (result) {
            window.location.reload(true);
        }
    });
}
