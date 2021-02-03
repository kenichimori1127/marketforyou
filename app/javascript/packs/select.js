$(function() {
    $('select').change(function() {
        let select_value = $(this).val();
        $('input[name="user_id"]').val(select_value);
    });

    $('select').change(function() {
        let select_value = $(this).val();
        $('input[name="staff_id"]').val(select_value);
    });
});